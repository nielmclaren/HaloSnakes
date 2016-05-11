
public class HaloPandemic {
  private final float P_DEATH = 0.5;
  private final float P_INFECT = 0.25;

  private HaloGrid grid;
  private ArrayList<HaloInfection> infections;

  HaloPandemic(HaloGrid gridArg, int numInfections) {
    grid = gridArg;

    setupInfections(numInfections);
  }

  private void setupInfections(int numInfections) {
    infections = new ArrayList<HaloInfection>();
    for (int i = 0; i < numInfections; i++) {
      HaloCell cell = grid.get(
          floor(random(grid.width())),
          floor(random(grid.height())));

      infections.add(new HaloInfection(cell));
    }
  }

  public ArrayList<HaloInfection> infections() {
    return infections;
  }

  public HaloPandemic step() {
    stepDeaths();
    stepInfections();
    return this;
  }

  private void stepDeaths() {
    if (infections.size() <= 1) {
      return;
    }

    for (int i = 0; i < infections.size(); i++) {
      if (random(1) < P_DEATH) {
        infections.remove(i);
        i--;

        if (infections.size() <= 1) {
          return;
        }
      }
    }
  }

  private void stepInfections() {
    ArrayList<HaloInfection> nextInfections = (ArrayList<HaloInfection>)infections.clone();
    for (int i = 0; i < infections.size(); i++) {
      HaloInfection infection = infections.get(i);
      nextInfections.addAll(infectNeighbors(infection.cell()));
    }
    infections = nextInfections;
  }

  private ArrayList<HaloInfection> infectNeighbors(HaloCell cell) {
    ArrayList<HaloInfection> infectedNeighbors = new ArrayList<HaloInfection>();

    ArrayList<HaloCell> neighbors = cell.getNeighbors();
    for (int i = 0; i < neighbors.size(); i++) {
      HaloCell neighborCell = neighbors.get(i);
      if (!hasInfection(neighborCell) && random(1) < P_INFECT) {
        infectedNeighbors.add(new HaloInfection(neighborCell));
      }
    }

    return infectedNeighbors;
  }

  private boolean hasInfection(HaloCell cell) {
    return hasInfection(cell.x(), cell.y());
  }

  private boolean hasInfection(int x, int y) {
    for (int i = 0; i < infections.size(); i++) {
      HaloInfection infection = infections.get(i);
      if (infection.cell().x() == x && infection.cell().y() == y) {
        return true;
      }
    }
    return false;
  }
}
