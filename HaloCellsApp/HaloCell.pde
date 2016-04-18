
public class HaloCell {
  private int x;
  private int y;

  private HaloCell nNeighbor;
  private HaloCell neNeighbor;
  private HaloCell eNeighbor;
  private HaloCell seNeighbor;
  private HaloCell sNeighbor;
  private HaloCell swNeighbor;
  private HaloCell wNeighbor;
  private HaloCell nwNeighbor;

  HaloCell(int xArg, int yArg) {
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

  public HaloCell nNeighbor() {
    return nNeighbor;
  }
  public HaloCell nNeighbor(HaloCell v) {
    nNeighbor = v;
    return this;
  }

  public HaloCell neNeighbor() {
    return neNeighbor;
  }
  public HaloCell neNeighbor(HaloCell v) {
    neNeighbor = v;
    return this;
  }

  public HaloCell eNeighbor() {
    return eNeighbor;
  }
  public HaloCell eNeighbor(HaloCell v) {
    eNeighbor = v;
    return this;
  }

  public HaloCell seNeighbor() {
    return seNeighbor;
  }
  public HaloCell seNeighbor(HaloCell v) {
    seNeighbor = v;
    return this;
  }

  public HaloCell sNeighbor() {
    return sNeighbor;
  }
  public HaloCell sNeighbor(HaloCell v) {
    sNeighbor = v;
    return this;
  }

  public HaloCell swNeighbor() {
    return swNeighbor;
  }
  public HaloCell swNeighbor(HaloCell v) {
    swNeighbor = v;
    return this;
  }

  public HaloCell wNeighbor() {
    return wNeighbor;
  }
  public HaloCell wNeighbor(HaloCell v) {
    wNeighbor = v;
    return this;
  }

  public HaloCell nwNeighbor() {
    return nwNeighbor;
  }
  public HaloCell nwNeighbor(HaloCell v) {
    nwNeighbor = v;
    return this;
  }
}
