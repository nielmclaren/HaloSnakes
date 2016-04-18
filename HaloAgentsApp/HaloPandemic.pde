
public class HaloPandemic {
  private HaloGrid grid;
  private ArrayList<HaloInfection> infections;

  HaloPandemic(HaloGrid gridArg, int numInfections) {
    grid = gridArg;

    setupInfections(numInfections);
  }

  private void setupInfections(int numInfections) {
    infections = new ArrayList<HaloInfection>();
    for (int i = 0; i < numInfections; i++) {
      HaloAgent agent = grid.get(
          floor(random(grid.width())),
          floor(random(grid.height())));

      infections.add(new HaloInfection(agent));
    }
  }

  public ArrayList<HaloInfection> infections() {
    return infections;
  }

  public HaloPandemic step() {
    for (int i = 0; i < infections.size(); i++) {
      HaloInfection infection = infections.get(i);
      infection.step();
    }
    return this;
  }
}
