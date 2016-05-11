
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
      drawHalo(g, infection.age(), cell.x(), cell.y());
    }
  }

  private void drawHalo(PGraphics g, int age, int x, int y) {
    int cellSize = config.cellSize();
    float radius = map(age, 0, 64, cellSize * 0.4, cellSize * 0.8);
    stroke(128);
    fill(255, 0, 0);
    ellipse(
        cellSize/2 + x * cellSize, cellSize/2 + y * cellSize,
        radius, radius);
  }
}
