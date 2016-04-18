
public class HaloPandemic {
  private HaloGrid grid;
  private HaloInfection infection;

  HaloPandemic(HaloGrid gridArg) {
    grid = gridArg;

    HaloAgent agent = grid.get(
        floor(random(grid.width())),
        floor(random(grid.height())));
    infection = new HaloInfection(agent);
  }

  public HaloInfection infection() {
    return infection;
  }

  public HaloPandemic step() {
    infection.step();
    return this;
  }
}
