
public class Infection {
  private HaloCell cell;
  private int age;

  Infection(HaloCell cellArg) {
    cell = cellArg;
    age = 0;
  }

  public HaloCell cell() {
    return cell;
  }

  public Infection step() {
    age++;
    return this;
  }

  public int age() {
    return age;
  }
}
