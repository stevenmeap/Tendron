public class Tendril{
  public static final int LENGTH = 4;
  
  private float x, y;
  private int current, segments;
  private double angle;
  private float startX, startY, endX, endY;
  
  public Tendril(int amount, double angle, float x, float y){
    this.segments = amount;
    if(segments < 3) return;
    current = 0;
    this.x = x;
    this.y = y;
    this.angle = angle;
    startY = y;
    startX = x;
    
    show();
    
  }
  
  public void show(){
    if(current < segments){
      endX = (float) (startX + (LENGTH * Math.cos(angle)));
      endY = (float) (startY + (LENGTH * Math.sin(angle)));
      pushMatrix();
      stroke(segments/ 50, 255/segments, 0);
      line(startX, startY, endX, endY);
      popMatrix();
      startX = endX;
      startY = endY;
      angle += Math.random() > 0.5 ? 0.2 : -0.2;
      current++;
      show();
    }else {
      Cluster cluster = new Cluster(segments / 3, startX, startY);
      cluster.createCluster();
    }
  }
  public float getCenterX(){
    return x;
  }
  public float getCenterY(){
    return y;
  }
}
