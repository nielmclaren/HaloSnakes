
public class SnakePit {
  private HaloGrid grid;
  private ArrayList<Snake> snakes;
  private int forceJumpMode;

  SnakePit(HaloGrid gridArg, int snakeCount) {
    grid = gridArg;
    snakes = createSnakes(snakeCount);

    forceJumpMode = ForceJumpMode.NONE;
  }

  public HaloGrid grid() {
    return grid;
  }

  public int forceJumpMode() {
    return forceJumpMode;
  }
  public SnakePit forceJumpMode(int v) {
    forceJumpMode = v;
    forceJumpChanged();
    return this;
  }

  private void forceJumpChanged() {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      snake.forceJumpMode(forceJumpMode);
    }
  }

  private ArrayList<Snake> createSnakes(int count) {
    ArrayList<Snake> result = new ArrayList<Snake>();
    for (int i = 0; i < count; i++) {
      result.add(new Snake(grid.get(
          floor(random(grid.width())),
          floor(random(grid.height()))))
        .forceJumpMode(forceJumpMode));
    }
    return result;
  }

  public ArrayList<Snake> snakes() {
    return (ArrayList<Snake>)snakes.clone();
  }

  public SnakePit step() {
    for (int i = 0; i < snakes.size(); i++) {
      Snake snake = snakes.get(i);
      snake.step();
    }
    return this;
  }
}
