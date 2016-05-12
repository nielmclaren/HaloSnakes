
public class Snake {
  private int x;
  private int y;
  private boolean isClockwise;
  private float angle;

  Snake(int xArg, int yArg) {
    x = xArg;
    y = yArg;
    isClockwise = random(1) < 0.5;
    angle = random(2 * PI);
  }

  public int x() {
    return x;
  }
  public Snake x(int v) {
    x = v;
    return this;
  }

  public int y() {
    return y;
  }
  public Snake y(int v) {
    y = v;
    return this;
  }

  public boolean isClockwise() {
    return isClockwise;
  }
  public Snake isClockwise(boolean v) {
    isClockwise = v;
    return this;
  }

  public float angle() {
    return angle;
  }
  public Snake angle(float v) {
    angle = v;
    return this;
  }

  public Snake step() {
    return this;
  }
}
