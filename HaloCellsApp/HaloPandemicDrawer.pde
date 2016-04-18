
public class HaloPandemicDrawer {
  private HaloPandemic pandemic;
  private DrawConfig config;

  HaloPandemicDrawer(HaloPandemic pandemicArg, DrawConfig configArg) {
    pandemic = pandemicArg;
    config = configArg;
  }

  public void draw(PGraphics g) {
    ArrayList<HaloInfection> infections = pandemic.infections();
    for (int i = 0; i < infections.size(); i++) {
      HaloInfection infection = infections.get(i);
      HaloCell cell = infection.cell();
      drawHalo(g, cell.x(), cell.y());
    }
  }

  private void drawHalo(PGraphics g, int x, int y) {
    int cellSize = config.cellSize();
    stroke(128);
    fill(255, 0, 0);
    ellipse(
        cellSize/2 + x * cellSize, cellSize/2 + y * cellSize,
        cellSize * 0.8, cellSize * 0.8);
  }
}
