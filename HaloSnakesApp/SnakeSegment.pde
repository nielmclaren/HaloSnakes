
public class SnakeSegment {
  private HaloCell cell;
  private boolean isClockwise;
  private float startAngle;
  private float endAngle;

  SnakeSegment(Snake snake, float startAngleArg) {
    cell = snake.cell();
    isClockwise = snake.isClockwise();
    startAngle = startAngleArg;
    endAngle = snake.angle();
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
  public SnakeSegment isClockwise(boolean v) {
    isClockwise = v;
    return this;
  }

  public float startAngle() {
    return startAngle;
  }

  public float endAngle() {
    return endAngle;
  }
  public SnakeSegment endAngle(float v) {
    endAngle = v;
    return this;
  }

  public float interpolatedAngle(float t) {
    int dir = isClockwise ? 1 : -1;
    return startAngle + t * dir * angleDifference();
  }

  public float angleDifference() {
    float a = startAngle;
    float b = endAngle;
    int dir = isClockwise ? 1 : -1;

    // FIXME: Simplify.
    if (dir > 0) {
      if (b >= a) {
        return b - a;
      }
      else {
        return 2 * PI - (a - b);
      }
    }
    else {
      if (a >= b) {
        return a - b;
      }
      else {
        return 2 * PI - (b - a);
      }
    }
  }
}
