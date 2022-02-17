private Slider slider;
private int clusters;

public void setup() {
  size(600, 600);
  slider = new Slider(300, 25, 600, 25, false, 50, 25);
}

public void draw() {
  if (clusters < slider.getProgress()) {
    Cluster cluster = new Cluster(50, 300, 300);
    cluster.createCluster();
    clusters++;
  } else if (clusters > slider.getProgress()) {
    background(240);
    clusters = 0;
  }
  slider.drawBounds();
}
