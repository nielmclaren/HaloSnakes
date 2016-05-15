
public class SnakePitHaloBufferDrawer {
  private SnakePit snakePit;
  private HaloBuffer buffer;

  SnakePitHaloBufferDrawer(SnakePit snakePitArg, Halo haloArg) {
    snakePit = snakePitArg;
    grid = snakePitArg.grid();
    buffer = new HaloBuffer(grid, haloArg);
  }

  public void draw() {
    buffer.setAll(0x000000);
    drawSnakes(snakePit.snakes());
    buffer.flush();
  }

  private void drawSnakes(ArrayList<Snake> snakes) {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      drawSnake(snake);
    }
  }

  private void drawSnake(Snake snake) {
    drawSnakeSegments(snake);
  }

  private void drawSnakeSegments(Snake snake) {
    float remainder = snake.length();
    for (int i = 0; i < snake.segmentCount(); i++) {
      SnakeSegment segment = snake.segment(i);
      drawSnakeSegment(snake, segment, remainder);
      remainder -= segment.angleDifference();
    }
  }

  private void drawSnakeSegment(Snake snake, SnakeSegment segment, float remainderLength) {
    float startAngle = segment.startAngle();
    float endAngle = segment.endAngle();
    float delta = segment.angleDifference();
    int dir = segment.isClockwise() ? 1 : -1;
    float currLength = 0;

    int z = transformAngle(endAngle);
    while (true) {
      if (currLength > remainderLength) {
        break;
      }
      if (z == transformAngle(startAngle)) {
        break;
      }

      buffer.addLed(segment.x(), segment.y(), z, snake.snakeColor());
      z = nextZ(z, dir);
      currLength += 2 * PI / grid.depth();
    }
  }

  private int nextZ(int z, int dir) {
    int depth = grid.depth();
    z -= dir;
    if (z >= depth) {
      z = 0;
    }
    if (z < 0) {
      z = depth - 1;
    }
    return z;
  }

  private void drawAngle(PGraphics g, int x, int y, float angle, float sizeFactor) {
    int cellSize = config.cellSize();
    float x0 = cellSize/2 + x * cellSize;
    float y0 = cellSize/2 + y * cellSize;
    float x1 = x0 + cos(angle) * cellSize * sizeFactor * 0.5;
    float y1 = y0 + sin(angle) * cellSize * sizeFactor * 0.5;
    g.line(x0, y0, x1, y1);
  }

  private int transformAngle(float v) {
    v += 3 * PI/2;
    while (v < 0) {
      v += 2 * PI;
    }
    while (v >= 2 * PI) {
      v -= 2 * PI;
    }
    return floor(map(v, 0, 2 * PI, 0, 30));
  }
}
