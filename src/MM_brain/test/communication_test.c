/*!
   \file communication_test.c
   \author MMteam


   \brief Main test for the communication module.

   \date 2020
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <signal.h>
#include <time.h>

#include "box.h"
#include "flood_fill.h"
#include "control.h"
#include "maze.h"
#include "position.h"
#include "communication.h"
#include "queue.h"
#include "utils.h"
#include "cell_estim.h"

/* GLOBAL VARIABLES */
RX_Message rx_msg;
TX_Message tx_msg;
SensorData sensor_data;
HeaderData header_data;

int main(void)
{
   log_message("INFO", "Listener", "run", "Starting listener...");
   log_message("INFO", "Writer", "run", "Starting writer...");
   set_starting_time();

   create_fifo();
   
   int **vertical_walls, **horizontal_walls;
   struct Maze logical_maze;
   struct Micromouse status;

   while(1) {
      read_fifo(&rx_msg);
      format_rx_data_mm(rx_msg, &status);

      switch(rx_msg.flag) {
         case HEADER_FLAG:
            //dump_header_data(status);
            init_cell(&status);
            update_control(&status, 1); // initialise values

            vertical_walls = init_vote_array((status.header_data.maze_width / status.header_data.box_width) + 1);
            horizontal_walls = init_vote_array((status.header_data.maze_width / status.header_data.box_width) + 1);

            logical_maze = initMaze(status.header_data.maze_height / status.header_data.box_height);

            break;
         case SENSOR_FLAG:
            //dump_sensor_data(status);
            //dump_estimation_data(status);
            update_cell(&status);
            update_control(&status, 0); // initialise values
            break;
      }
      //dump_estimation_data(status);
      write_fifo(tx_msg, MOTOR_FLAG, &status);
      
      vote_for_walls(&logical_maze, detect_wall(status), vertical_walls, horizontal_walls, 15);
      /* Adjust display time step */
      if ((int)time(NULL)%5 == 4) {
         //display_logical_maze(status, 15, vertical_walls, horizontal_walls);
         //displayMaze(logical_maze);
      }
         

   }

   return 0;
}