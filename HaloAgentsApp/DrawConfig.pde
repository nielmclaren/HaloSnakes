
public class DrawConfig {
  private int cellSize;

  DrawConfig() {
    cellSize = 10;
  }

  public DrawConfig cellSize(int cellSizeArg) {
    cellSize = cellSizeArg;
    return this;
  }
  public int cellSize() {
    return cellSize;
  }
}
