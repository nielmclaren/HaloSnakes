
public class PandemicHaloDrawer {
  private Pandemic pandemic;
  private Halo halo;
  private Palette palette;

  PandemicHaloDrawer(Pandemic pandemicArg, Halo haloArg) {
    pandemic = pandemicArg;
    halo = haloArg;

    palette = new Palette();
  }

  public PandemicHaloDrawer palette(Palette p) {
    palette = p;
    return this;
  }

  public Palette palette() {
    return palette;
  }

  public void draw() {
    HaloGrid grid = pandemic.grid();
    for (int x = 0; x < grid.width(); x++) {
      for (int y = 0; y < grid.height(); y++) {
        drawCell(x, y);
      }
    }
  }

  private void drawCell(int x, int y) {
    Infection infection = pandemic.getInfection(x, y);
    if (infection == null) {
      drawHealthyHalo(x, y);
    }
    else {
      drawInfectedHalo(infection.age(), x, y);
    }
  }

  private void drawHealthyHalo(int x, int y) {
    halo.controlHalo(x, y, 0x000000, 0.4);
  }

  private void drawInfectedHalo(int age, int x, int y) {
    halo.controlHalo(x, y, getColor(age), 0.4);
  }

  private color getColor(int age) {
    return palette.get(map(age, 0, 64, 0, 1));
  }
}
