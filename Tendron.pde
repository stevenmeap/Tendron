private Slider slider;

public void setup(){
  size(600,600);
  slider = new Slider(300,25,600, 25);
  //Tendril tendril = new Tendril(100,Math.random() * 2 * PI, 300,300);
}

public void draw(){
  slider.drawBounds();
}

public void mousePressed(){
  Cluster cluster = new Cluster(50, 300, 300);
  cluster.createCluster();
}
