public class Slider {
  private float centerX, centerY;
  private float x, y;
  private int width, height;
  private int r, g, b, r1, g1, b1;
  private int cr, cg, cb;
  private boolean activated;


  public Slider(int x, int y, int width, int height) {
    this.centerX = x;
    this.centerY = y;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    r = 230;
    g = 230;
    b = 230;
    r1 = 150;
    g1 = 150;
    b1 = 150;
    cr = r1;
    cg = g1;
    cb = b1;
  }

  public void setBackground(int r, int g, int b) {
    this.r = r;
    this.g = b;
    this.b = b;
  }
  public void setFadeToColor(int r, int g, int b) {
    this.r1 = r;
    this.g1 = g;
    this.b1 = b;
  }

  public void drawBounds() {
    pushMatrix();
    fill(r, g, b);
    rectMode(CENTER);
    rect(centerX, centerY, width, height);
    popMatrix();
    drawSlider();
  }

  public void drawSlider() {
    pushMatrix();
    mouseInteractions();
    fill(cr, cg, cb);
    rectMode(CENTER);
    rect(x, y, width/4, height);
    popMatrix();
  }

  private void mouseInteractions() {
    double mx = mouseX;
    double my = mouseY;
    boolean mouseon =  (mx > x - (this.width/8) && mx < x + (this.width/8) && my > y - (this.height/2) && my < y + (this.height/2));
    if (mouseon) {
      if (mousePressed) {
        activated = true;
      } else {
        if (cr > r1 + (r1/4)) cr--;
        if (cg > g1 + (g1/4)) cg--;
        if (cb > b1 + (b1/4)) cb--;
        if (cr < r1 + (r1/4)) cr++;
        if (cg < g1 + (g1/4)) cg++;
        if (cb < b1 + (b1/4)) cb++;
      }
    } else {
      if (cr < r1 + (r1/2)) cr = cr + 1 <= 255 ? cr + 1 : 255;
      if (cg < g1 +(g1/2)) cg = cg + 1 <= 255 ? cg + 1 : 255;
      if (cb < b1 + (b1/2)) cb = cb + 1 <= 255 ? cb + 1 : 255;
    }
    if (!mousePressed) activated = false;
    if (activated) {
      x = (this.width/8) + mouseX <= 600 ? mouseX : 600 - this.width/8;
      if (cr > r1) cr--;
      if (cg > g1) cg--;
      if (cb > b1) cb--;
    }
  }
  public int getX() {
    return (int) x;
  }
  public int getY() {
    return (int) y;
  }
}
