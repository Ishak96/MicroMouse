import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.*;

public class Listener extends Thread {
    protected File rxFile;
    protected FileInputStream rxStream;
    protected Message rxMessage;

    public Listener() {
        this.rxFile = new File(CommunicationUtility.FIFO_PATH + CommunicationUtility.FIFO_RX_FILENAME);
        this.setName("Listener process");
        this.setDaemon(true);
        this.start();
    }

    public Message getRxMessage() {
        return this.rxMessage;
    }

    public void run() {
        if (!this.rxFile.exists()) {
            if (osName.toLowerCase().contains("linux") || osName.toLowerCase().contains("macos")) {
                try {
                    Process p = Runtime.getRuntime().exec("mkfifo " + CommunicationUtility.FIFO_PATH + CommunicationUtility.FIFO_RX_FILENAME);
                } catch(Exception e) {
                    e.printStackTrace(); 
                    System.out.println(e); 
                }
              
            }
        }

        CommunicationUtility.logMessage("INFO", "Listener", "run", "Starting listener...");
        while (true) {
            CommunicationUtility.logMessage("INFO", "Listener", "run", "Listening...");
            readFifo();
        }
    }

    /***************************************************************************************************************************
    * GLOBAL FORMAT (in bytes)
    * +----------+-------------+
    * | FLAG (1) | CONTENT (8) |
    * +----------+-------------+
    *
    * CONTENT :
    *      FLAG=MOTOR
    *          - MOTOR# = motor power
    * +------------+------------+
    * | MOTORL (4) | MOTORR (4) |
    * +------------+------------+
    ***************************************************************************************************************************/
    public void readFifo() {
        try {
            /* RESET VALUES */
            rxStream = new FileInputStream(CommunicationUtility.FIFO_PATH + CommunicationUtility.FIFO_RX_FILENAME);
            byte[] rawData = new byte[CommunicationUtility.MAX_MSG_SIZE], sliced;
            byte fileByte = 0;
            int cursor = 0;
            String logMsg = "";

            /* READ PIPE */
            while ((fileByte = (byte) rxStream.read()) != -1 && cursor < 50) {
              rawData[cursor] = fileByte;
              cursor++;
            }

            /* rawData[0] = FLAG */
            logMsg += "Received : ";
            switch (rawData[0]) {
                case CommunicationUtility.MOTOR_FLAG:
                    sliced = Arrays.copyOfRange(rawData, 1, CommunicationUtility.MOTOR_CONTENT_SIZE + 1);
                    
                    this.rxMessage = new MotorData();
                    MotorData motorDataMsg = new MotorData();
                    motorDataMsg.setContent(sliced);
                    motorDataMsg.formatMessage();
                    motorDataMsg.setLeftPowerMotor();
                    motorDataMsg.setRightPowerMotor();
                    this.rxMessage = motorDataMsg;

                    /* LOGS */
                    logMsg += this.rxMessage.getLeftPowerMotor() + " " + this.rxMessage.getRightPowerMotor();
                    break;
                default:
                    CommunicationUtility.logMessage("ERROR", "Listener", "readFifo", "No matching flag found.");
            }
            CommunicationUtility.logMessage("INFO", "Listener", "readFifo", logMsg);
            // CLEAN UP
            rxStream.close();
        } catch(Exception e) {
            e.printStackTrace(); 
            System.out.println(e); 
        }
    }
}