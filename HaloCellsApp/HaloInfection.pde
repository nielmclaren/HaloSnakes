
public class HaloInfection {
  private HaloCell cell;

  HaloInfection(HaloCell cellArg) {
    cell = cellArg;
  }

  public HaloCell cell() {
    return cell;
  }

  private ArrayList<HaloCell> getNeighbors() {
    ArrayList<HaloCell> neighbors = new ArrayList<HaloCell>();
    if (cell.nNeighbor() != null) {
      neighbors.add(cell.nNeighbor());
    }
    if (cell.neNeighbor() != null) {
      neighbors.add(cell.neNeighbor());
    }
    if (cell.eNeighbor() != null) {
      neighbors.add(cell.eNeighbor());
    }
    if (cell.seNeighbor() != null) {
      neighbors.add(cell.seNeighbor());
    }
    if (cell.sNeighbor() != null) {
      neighbors.add(cell.sNeighbor());
    }
    if (cell.swNeighbor() != null) {
      neighbors.add(cell.swNeighbor());
    }
    if (cell.wNeighbor() != null) {
      neighbors.add(cell.wNeighbor());
    }
    if (cell.nwNeighbor() != null) {
      neighbors.add(cell.nwNeighbor());
    }
    return neighbors;
  }
}
