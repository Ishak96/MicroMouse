public class Sensor {
  private EdgeShapesCallback callback;
  
  private Vec2 source;
   private Vec2 target;
   private final Vec2 relativePos;
   private Vec2 castPoint;
   
   private float len;
   private float angle;
   private float value;
   
   public Sensor(Vec2 source, float angle, float len) {
     callback = new EdgeShapesCallback();
     
     relativePos = source;
   
     source = new Vec2(0, 0);
     target = new Vec2(0, 0);
     castPoint = new Vec2(0, 0);
     
     this.angle = angle;
     this.len = len * box2d.scaleFactor / 10;
     this.value = 0.0;
   }
   
   public Vec2 getSource() {
     return source;
   }
   
   public void setSource(Vec2 source) {
     this.source = source;
   }
   
   public Vec2 getTarget() {
     return target;
   }
   
   public void setTarget(Vec2 target) {
     this.target = target;
   }
   
   public float getLen() {
     return len;
   }
   
   public void setLen(float len) {
     this.len = len;
   }
   
   public float getAngle() {
     return angle;
   }
   
   public void update(Vec2 vehiclePos, float vehicleAngle) {
     // calculating the translation and rotation to find the position of the sensors from the vehicle's pos and angle
     // [cos(a) , sin(a), 0]   [1, 0, tx]   [x]
     // |-sin(a), cos(a), 0| * |0, 1, ty] * [y]
     // [0,    0,      0, 1]   [0, 0, 1 ]   [1] 
     vehiclePos = box2d.coordWorldToPixels(vehiclePos);
     source = new Vec2(vehiclePos.x-SimulationUtility.MAZE_SHIFTX + relativePos.x * cos(-vehicleAngle) - relativePos.y * sin(-vehicleAngle), 
                       vehiclePos.y-SimulationUtility.MAZE_SHIFTY + relativePos.x * sin(-vehicleAngle) + relativePos.y * cos(-vehicleAngle));
     
     
     target = new Vec2(source.x + len * cos(angle - vehicleAngle), source.y + len * sin(angle - vehicleAngle));
     
     source = box2d.coordPixelsToWorld(source);
     target = box2d.coordPixelsToWorld(target);
     sensorDetect();
   }
   
   public void sensorDetect() {
     callback.setM_fixture(null);
     
     box2d.world.raycast(callback, source, target);
     if (callback.getM_fixture() != null) {
        castPoint = callback.getM_point();
        value = dist(castPoint.x, castPoint.y, source.x, source.y);
        println(castPoint);
   } else {
        value = -1;
     }
   }
   
   public void display() {
     Vec2 sourceP = box2d.coordWorldToPixels(source);
     Vec2 targetP = box2d.coordWorldToPixels(target);
     Vec2 castP = box2d.coordWorldToPixels(castPoint);
     println(castPoint, castP);
     stroke(180);
     dash.line(sourceP.x ,sourceP.y, targetP.x, targetP.y);
     stroke(255, 0, 0);
     if(value != -1)
       ellipse(castP.x, castP.y, 10, 10);
     stroke(0);
   }
   
   public float getValue() {
     return value;
   }
}
