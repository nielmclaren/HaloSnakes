
public class Snake {
  private int x;
  private int y;
  private boolean isClockwise;
  private float angle;
  private float speed;

  Snake(int xArg, int yArg) {
    x = xArg;
    y = yArg;
    isClockwise = random(1) < 0.5;
    angle = random(2 * PI);

    speed = PI / 32;
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
    if (isClockwise) {
      angle += speed;
      while (angle > 2 * PI) {
        angle -= 2 * PI;
      }
    }
    else {
      angle -= speed;
      while (angle < 0) {
        angle += 2 * PI;
      }
    }

    return this;
  }
}