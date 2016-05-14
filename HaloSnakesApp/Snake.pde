
import java.util.LinkedList;

public class Snake {
  private final float P_JUMP = 0.75;

  private HaloCell cell;
  private boolean isClockwise;
  private float angle;
  private float length;
  private float maxLength;
  private float speed;
  private LinkedList<SnakeSegment> segments;
  private float segmentStartAngle;
  private int forceJumpMode;

  Snake(HaloCell cellArg) {
    cell = cellArg;
    isClockwise = random(1) < 0.5;
    angle = random(2 * PI);
    length = 0;
    maxLength = 2 * PI;

    speed = PI / 16;
    segments = new LinkedList<SnakeSegment>();
    segmentStartAngle = angle;

    forceJumpMode = ForceJumpMode.NONE;
  }

  public int x() {
    return cell.x();
  }

  public int y() {
    return cell.y();
  }

  public HaloCell cell() {
    return cell;
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

  public float maxLength() {
    return maxLength;
  }
  public Snake maxLength(float v) {
    maxLength = v;
    return this;
  }

  public SnakeSegment segment(int jumpsAgo) {
    if (jumpsAgo <= 0 || segments.size() <= 0) {
      return new SnakeSegment(this, segmentStartAngle);
    }
    return segments.get(min(jumpsAgo - 1, segments.size() - 1));
  }

  public int segmentCount() {
    return segments.size() + 1;
  }

  public int forceJumpMode() {
    return forceJumpMode;
  }
  public Snake forceJumpMode(int v) {
    forceJumpMode = v;
    return this;
  }

  public Snake step() {
    float prevAngle = angle;
    angle = stepAngle(angle);
    length = stepLength(length);

    if (!isSameQuadrant(prevAngle, angle)) {
      potentialJump();
    }

    return this;
  }

  private void potentialJump() {
    attemptJump();
  }

  private void attemptJump() {
    if (forceJumpMode == ForceJumpMode.JUMP
        || forceJumpMode == ForceJumpMode.NONE
        && random(1) < P_JUMP) {
      HaloCell jumpNeighbor = getJumpNeighbor(angle);
      if (jumpNeighbor == null) {
        recordSegment(new SnakeSegment(this, angle));
      }
      else {
        recordSegment(new SnakeSegment(this, segmentStartAngle));
        cell = jumpNeighbor;
        isClockwise = !isClockwise;

        if (isHorizontalJump(angle)) {
          angle = clampAngle(PI - angle);
        }
        else {
          angle = clampAngle(-angle);
        }
        segmentStartAngle = angle;
      }
    }
  }

  private void recordSegment(SnakeSegment v) {
    segments.addFirst(v);
    int segmentCount = floor(length / (PI / 2));
    while (segments.size() > segmentCount) {
      segments.removeLast();
    }
  }

  private boolean isHorizontalJump(float a) {
    int quadrant = getQuadrant(clampAngle(a + PI / 4));
    return quadrant == 0 || quadrant == 2;
  }

  private HaloCell getJumpNeighbor(float a) {
    int quadrant = getQuadrant(clampAngle(a + PI / 4));
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
      a = clampAngle(a + speed);
    }
    else {
      a = clampAngle(a - speed);
    }
    return a;
  }

  private float stepLength(float v) {
    return min(maxLength, v + speed);
  }

  private float clampAngle(float a) {
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
