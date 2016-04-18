
public class HaloInfection {
  private HaloCell cell;

  HaloInfection(HaloCell cellArg) {
    cell = cellArg;
  }

  public HaloCell cell() {
    return cell;
  }

  public HaloInfection step() {
    cell = getNextCell(cell);
    return this;
  }

  private HaloCell getNextCell(HaloCell cell) {
    HaloCell nextCell = null;
    while (nextCell == null) {
      switch (floor(random(8))) {
        case 0:
          nextCell = cell.nNeighbor();
          break;
        case 1:
          nextCell = cell.neNeighbor();
          break;
        case 2:
          nextCell = cell.eNeighbor();
          break;
        case 3:
          nextCell = cell.seNeighbor();
          break;
        case 4:
          nextCell = cell.sNeighbor();
          break;
        case 5:
          nextCell = cell.swNeighbor();
          break;
        case 6:
          nextCell = cell.wNeighbor();
          break;
        case 7:
          nextCell = cell.nwNeighbor();
          break;
      }
    }
    return nextCell;
  }
}
