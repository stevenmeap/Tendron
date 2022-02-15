public class Cluster{
  public final static int STEMS = 7;
  
  private int tendrils;
  private int tendrilsize;
  private float x, y;
  public Cluster(int tendrilsize, float x, float y){
    this.x = x;
    this.y = y;
    this.tendrilsize = tendrilsize;
    this.tendrils = STEMS;
    
  }
  
  public void createCluster(){
    if(tendrils > 0){
      Tendril tendril = new Tendril(tendrilsize, Math.random() * (2 * PI), x, y);
      tendrils--;
      createCluster();
    }
  }
  
}
