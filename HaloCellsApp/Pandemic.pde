
public class Pandemic {
  private final float P_DEATH = 0.08;
  private final float P_INFECT = 0.02;
  private final int MIN_INFECTIONS = 10;

  private HaloGrid grid;
  private ArrayList<Infection> infections;

  Pandemic(HaloGrid gridArg, int numInfections) {
    grid = gridArg;

    setupInfections(numInfections);
  }

  private void setupInfections(int numInfections) {
    infections = new ArrayList<Infection>();
    for (int i = 0; i < numInfections; i++) {
      HaloCell cell = null;
      while (cell == null || hasInfection(cell)) {
        cell = grid.get(
            floor(random(grid.width())),
            floor(random(grid.height())));
      }

      infections.add(new Infection(cell));
    }
  }

  public HaloGrid grid() {
    return grid;
  }

  public ArrayList<Infection> infections() {
    return infections;
  }

  public Pandemic step() {
    stepDeaths();
    stepInfections();
    spreadInfections();
    return this;
  }

  private void stepDeaths() {
    if (infections.size() <= MIN_INFECTIONS) {
      return;
    }

    for (int i = 0; i < infections.size(); i++) {
      if (random(1) < P_DEATH) {
        infections.remove(i);
        i--;

        if (infections.size() <= MIN_INFECTIONS) {
          return;
        }
      }
    }
  }

  private void stepInfections() {
    for (int i = 0; i < infections.size(); i++) {
      infections.get(i).step();
    }
  }

  private void spreadInfections() {
    ArrayList<Infection> nextInfections = (ArrayList<Infection>)infections.clone();
    for (int i = 0; i < infections.size(); i++) {
      Infection infection = infections.get(i);
      nextInfections.addAll(infectNeighbors(infection.cell()));
    }
    infections = nextInfections;
  }

  private ArrayList<Infection> infectNeighbors(HaloCell cell) {
    ArrayList<Infection> infectedNeighbors = new ArrayList<Infection>();

    ArrayList<HaloCell> neighbors = cell.getNeighbors();
    for (int i = 0; i < neighbors.size(); i++) {
      HaloCell neighborCell = neighbors.get(i);
      if (!hasInfection(neighborCell) && random(1) < P_INFECT) {
        infectedNeighbors.add(new Infection(neighborCell));
      }
    }

    return infectedNeighbors;
  }

  public boolean hasInfection(HaloCell cell) {
    return hasInfection(cell.x(), cell.y());
  }

  public boolean hasInfection(int x, int y) {
    return getInfection(x, y) != null;
  }

  public Infection getInfection(HaloCell cell) {
    return getInfection(cell.x(), cell.y());
  }

  public Infection getInfection(int x, int y) {
    for (int i = 0; i < infections.size(); i++) {
      Infection infection = infections.get(i);
      if (infection.cell().x() == x && infection.cell().y() == y) {
        return infection;
      }
    }
    return null;
  }
}
