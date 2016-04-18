
public class HaloAgent {
  private int x;
  private int y;

  private HaloAgent nNeighbor;
  private HaloAgent neNeighbor;
  private HaloAgent eNeighbor;
  private HaloAgent seNeighbor;
  private HaloAgent sNeighbor;
  private HaloAgent swNeighbor;
  private HaloAgent wNeighbor;
  private HaloAgent nwNeighbor;

  HaloAgent(int xArg, int yArg) {
    x = xArg;
    y = yArg;

    nNeighbor = null;
    neNeighbor = null;
    eNeighbor = null;
    seNeighbor = null;
    sNeighbor = null;
    swNeighbor = null;
    wNeighbor = null;
    nwNeighbor = null;
  }

  public int x() {
    return x;
  }

  public int y() {
    return y;
  }

  public HaloAgent nNeighbor() {
    return nNeighbor;
  }
  public HaloAgent nNeighbor(HaloAgent v) {
    nNeighbor = v;
    return this;
  }

  public HaloAgent neNeighbor() {
    return neNeighbor;
  }
  public HaloAgent neNeighbor(HaloAgent v) {
    neNeighbor = v;
    return this;
  }

  public HaloAgent eNeighbor() {
    return eNeighbor;
  }
  public HaloAgent eNeighbor(HaloAgent v) {
    eNeighbor = v;
    return this;
  }

  public HaloAgent seNeighbor() {
    return seNeighbor;
  }
  public HaloAgent seNeighbor(HaloAgent v) {
    seNeighbor = v;
    return this;
  }

  public HaloAgent sNeighbor() {
    return sNeighbor;
  }
  public HaloAgent sNeighbor(HaloAgent v) {
    sNeighbor = v;
    return this;
  }

  public HaloAgent swNeighbor() {
    return swNeighbor;
  }
  public HaloAgent swNeighbor(HaloAgent v) {
    swNeighbor = v;
    return this;
  }

  public HaloAgent wNeighbor() {
    return wNeighbor;
  }
  public HaloAgent wNeighbor(HaloAgent v) {
    wNeighbor = v;
    return this;
  }

  public HaloAgent nwNeighbor() {
    return nwNeighbor;
  }
  public HaloAgent nwNeighbor(HaloAgent v) {
    nwNeighbor = v;
    return this;
  }
}
