
public class SnakePit {
  private HaloGrid grid;
  private ArrayList<Snake> snakes;

  SnakePit(HaloGrid gridArg, int snakeCount) {
    grid = gridArg;
    snakes = createSnakes(snakeCount);
  }

  private ArrayList<Snake> createSnakes(int count) {
    ArrayList<Snake> result = new ArrayList<Snake>();
    for (int i = 0; i < count; i++) {
      result.add(new Snake(
          floor(random(grid.width())),
          floor(random(grid.height()))));
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