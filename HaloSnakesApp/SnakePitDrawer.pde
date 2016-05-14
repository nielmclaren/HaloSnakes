
public class SnakePitDrawer {
  private SnakePit snakePit;
  private DrawConfig config;
  private boolean isDebug;

  SnakePitDrawer(SnakePit snakePitArg, DrawConfig configArg) {
    snakePit = snakePitArg;
    config = configArg;

    isDebug = true;
  }

  public SnakePitDrawer isDebug(boolean v) {
    isDebug = v;
    return this;
  }
  public boolean isDebug() {
    return isDebug;
  }

  public void draw(PGraphics g) {
    drawSnakes(g, snakePit.snakes());
  }

  private void drawSnakes(PGraphics g, ArrayList<Snake> snakes) {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      drawSnake(g, snake);
    }
  }

  private void drawSnake(PGraphics g, Snake snake) {
    drawSnakeHead(g, snake);
    drawSnakeSegments(g, snake);
    drawSnakeSteps(g, snake);
  }

  private void drawSnakeHead(PGraphics g, Snake snake) {
    if (snake.isClockwise()) {
      g.stroke(255, 0, 0);
    }
    else {
      g.stroke(0, 0, 255);
    }

    g.strokeWeight(2);
    g.noFill();

    drawAngle(g, snake.x(), snake.y(), snake.angle(), 1);
  }

  private void drawSnakeSegments(PGraphics g, Snake snake) {
    for (int i = 0; i < snake.segmentCount(); i++) {
      SnakeSegment segment = snake.segment(i);
      drawSnakeSegment(g, segment);
    }
  }

  private void drawSnakeSegment(PGraphics g, SnakeSegment segment) {
    g.stroke(0, 255, 0);
    g.strokeWeight(2);
    g.noFill();

    float startAngle = segment.startAngle();
    int dir = segment.isClockwise() ? 1 : -1;
    float delta = segment.angleDifference();
    int stepCount = 10;
    float stepSize = delta / stepCount;
    for (int i = 0; i < stepCount; i++) {
      float angle = startAngle + dir * i * stepSize;
      drawAngle(g, segment.x(), segment.y(), angle, 0.6);
    }
  }

  private void drawSnakeSteps(PGraphics g, Snake snake) {
    if (isDebug) {
      println("Draw snake steps");
    }

    g.stroke(255, 0, 0);
    g.strokeWeight(2);
    g.noFill();

    float length = snake.length();
    float stepSize = PI / 8;
    int stepCount = floor(length / stepSize);
    for (int i = 0; i < stepCount; i++) {
      float currLength = i * stepSize;
      SnakeSegment segment = getSegment(snake, currLength);
      if (isDebug) {
        println(i + ":\t" + deg(segment.startAngle()) + " to " + deg(segment.endAngle()) + " " + (segment.isClockwise() ? "CW" : "CCW"));
      }
      float remainder = getRemainderLength(snake, currLength);
      float angle = segment.interpolatedAngle(1 - remainder / segment.angleDifference());
      drawAngle(g, segment.x(), segment.y(), angle, 1);
    }
  }

  private void drawAngle(PGraphics g, int x, int y, float angle, float sizeFactor) {
    int cellSize = config.cellSize();
    float x0 = cellSize/2 + x * cellSize;
    float y0 = cellSize/2 + y * cellSize;
    float x1 = x0 + cos(angle) * cellSize * sizeFactor * 0.5;
    float y1 = y0 + sin(angle) * cellSize * sizeFactor * 0.5;
    g.line(x0, y0, x1, y1);
  }

  private SnakeSegment getSegment(Snake snake, float length) {
    int segmentCount = snake.segmentCount();
    int segmentIndex = 0;
    SnakeSegment segment = snake.segment(segmentIndex);
    while (length > segment.angleDifference() && segmentIndex < segmentCount - 1) {
      segmentIndex++;
      length -= segment.angleDifference();
      segment = snake.segment(segmentIndex);
    }

    return segment;
  }

  private float getRemainderLength(Snake snake, float length) {
    int segmentCount = snake.segmentCount();
    int segmentIndex = 0;
    SnakeSegment segment = snake.segment(segmentIndex);
    while (length > segment.angleDifference() && segmentIndex < segmentCount - 1) {
      segmentIndex++;
      length -= segment.angleDifference();
      segment = snake.segment(segmentIndex);
    }

    return length;
  }

  private int getDirection(float startAngle, float endAngle) {
    float d = abs(endAngle - startAngle);
    int dir = floor((endAngle - startAngle) / d);
    return d > PI ? -dir : dir;
  }

  private void drawStep(PGraphics g, float t, int x, int y, boolean isClockwise, float angle) {
    int cellSize = config.cellSize();
    float x0 = cellSize/2 + x * cellSize;
    float y0 = cellSize/2 + y * cellSize;
    float x1 = x0 + cos(angle) * cellSize * 0.4;
    float y1 = y0 + sin(angle) * cellSize * 0.4;

    if (isClockwise) {
      g.stroke(255, 0, 0, t * 100);
    }
    else {
      g.stroke(0, 0, 255, t * 100);
    }

    g.strokeWeight(2);
    g.noFill();

    g.line(x0, y0, x1, y1);
  }

  private float deg(float v) {
    return floor(v * 180/PI);
  }
}
