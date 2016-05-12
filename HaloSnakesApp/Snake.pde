
public class Snake {
  private HaloCell cell;
  private boolean isClockwise;
  private float angle;
  private float length;
  private float speed;

  Snake(HaloCell cellArg) {
    cell = cellArg;
    isClockwise = random(1) < 0.5;
    angle = random(2 * PI);
    length = 2 * PI;

    speed = PI / 32;
  }

  public int x() {
    return cell.x();
  }

  public int y() {
    return cell.y();
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

  public float length() {
    return length;
  }
  public Snake length(float v) {
    length = v;
    return this;
  }

  public Snake step() {
    float prevAngle = angle;
    angle = stepAngle(angle);

    if (!isSameQuadrant(prevAngle, angle) && random(1) < 0.5) {
      attemptJump();
    }

    return this;
  }

  private void attemptJump() {
    HaloCell jumpNeighbor = getJumpNeighbor();
    if (jumpNeighbor != null) {
      cell = jumpNeighbor;
    }
  }

  private HaloCell getJumpNeighbor() {
    int quadrant = getQuadrant(incrementAngle(angle, PI / 4));
    switch (quadrant) {
      case 0:
        return cell.eNeighbor();
      case 1:
        return cell.sNeighbor();
      case 2:
        return cell.wNeighbor();
      case 3:
        return cell.nNeighbor();
      default:
        return null;
    }
  }

  private float stepAngle(float a) {
    if (isClockwise) {
      a = incrementAngle(a, speed);
    }
    else {
      a = incrementAngle(a, -speed);
    }
    return a;
  }

  private float incrementAngle(float a, float delta) {
    a += delta;
    while (a >= 2 * PI) {
      a -= 2 * PI;
    }
    while (a < 0) {
      a += 2 * PI;
    }
    return a;
  }

  private boolean isSameQuadrant(float a, float b) {
    return getQuadrant(a) == getQuadrant(b);
  }

  private int getQuadrant(float a) {
    return floor(a * 4 / (2 * PI));
  }
}
