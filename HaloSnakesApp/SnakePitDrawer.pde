
public class SnakePitDrawer {
  private SnakePit snakePit;
  private DrawConfig config;

  SnakePitDrawer(SnakePit snakePitArg, DrawConfig configArg) {
    snakePit = snakePitArg;
    config = configArg;
  }

  public void draw(PGraphics g) {
    drawSnakes(g, snakePit.snakes());
  }

  private void drawSnakes(PGraphics g, ArrayList<Snake> snakes) {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      drawSnake(g, snake.x(), snake.y(), snake.isClockwise(), snake.angle());
    }
  }

  private void drawSnake(PGraphics g, int x, int y, boolean isClockwise, float angle) {
    int cellSize = config.cellSize();
    float x0 = cellSize/2 + x * cellSize;
    float y0 = cellSize/2 + y * cellSize;
    float x1 = x0 + cos(angle) * cellSize * 0.4;
    float y1 = y0 + sin(angle) * cellSize * 0.4;

    stroke(255, 0, 0);
    strokeWeight(4);
    noFill();
    line(x0, y0, x1, y1);
  }
}