
public class SnakePitHaloDrawer {
  private SnakePit snakePit;
  private Halo halo;

  SnakePitHaloDrawer(SnakePit snakePitArg, Halo haloArg) {
    snakePit = snakePitArg;
    halo = haloArg;
  }

  public void draw() {
    halo.controlAll(0x000000, 1.0);
    drawSnakes(snakePit.snakes());
  }

  private void drawSnakes(ArrayList<Snake> snakes) {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      drawSnake(snake);
    }
  }

  private void drawSnake(Snake snake) {
    halo.controlLed(
        snake.x(), snake.y(),
        transformAngle(snake.angle()),
        0xffffff, 0);
  }

  private int transformAngle(float v) {
    v += 3 * PI/2;
    while (v < 0) {
      v += 2 * PI;
    }
    while (v > 2 * PI) {
      v -= 2 * PI;
    }
    return floor(map(v, 0, 2 * PI, 0, 30));
  }
}
