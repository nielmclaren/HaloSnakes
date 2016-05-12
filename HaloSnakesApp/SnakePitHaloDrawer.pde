
public class SnakePitHaloDrawer {
  private SnakePit snakePit;
  private Halo halo;

  SnakePitHaloDrawer(SnakePit snakePitArg, Halo haloArg) {
    snakePit = snakePitArg;
    halo = haloArg;
  }

  public void draw() {
    halo.controlAll(0x000000, 0.5);
    drawSnakes(snakePit.snakes());
  }

  private void drawSnakes(ArrayList<Snake> snakes) {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      drawSnake(snake);
    }
  }

  private void drawSnake(Snake snake) {
    halo.controlLED(snake.x(), snake.y(),
        floor(map(snake.angle(), 0, 2 * PI, 0, 30)),
        0xffffff, 0);
  }
}