
public class HaloInfection {
  private HaloCell cell;
  private int age;

  HaloInfection(HaloCell cellArg) {
    cell = cellArg;
    age = 0;
  }

  public HaloCell cell() {
    return cell;
  }

  public HaloInfection step() {
    age++;
    return this;
  }

  public int age() {
    return age;
  }
}
