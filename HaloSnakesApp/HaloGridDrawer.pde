
public class HaloGridDrawer {
  private HaloGrid grid;
  private DrawConfig config;

  HaloGridDrawer(HaloGrid gridArg, DrawConfig configArg) {
    grid = gridArg;
    config = configArg;
  }

  public void draw(PGraphics g) {
    drawHalos(g);
  }

  private void drawHalos(PGraphics g) {
    for (int x = 0; x < grid.width(); x++) {
      for (int y = 0; y < grid.height(); y++) {
        drawHalo(g, x, y);
      }
    }
  }

  private void drawHalo(PGraphics g, int x, int y) {
    int cellSize = config.cellSize();
    stroke(128);
    fill(255);
    ellipse(
        cellSize/2 + x * cellSize, cellSize/2 + y * cellSize,
        cellSize * 0.8, cellSize * 0.8);
  }
}
