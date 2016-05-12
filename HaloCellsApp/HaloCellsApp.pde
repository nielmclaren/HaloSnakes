
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

HaloGrid grid;
HaloGridDrawer gridDrawer;
Pandemic pandemic;
PandemicDrawer pandemicDrawer;
Halo halo;
PandemicHaloDrawer pandemicHaloDrawer;

void setup() {
  size(640, 480);

  DrawConfig config = new DrawConfig()
    .cellSize(40);

  grid = new HaloGrid(12, 6);
  gridDrawer = new HaloGridDrawer(grid, config);

  pandemic = new Pandemic(grid, 12);
  pandemicDrawer = new PandemicDrawer(pandemic, config);

  halo = new Halo(
      new OscP5(this, 12000),
      new NetAddress("127.0.0.1", 1314));

  pandemicHaloDrawer = new PandemicHaloDrawer(pandemic, halo)
    .palette(new Palette().load("palette.png"));
}

void draw() {
  if (frameCount % 5 == 0) {
    pandemic.step();
  }

  background(0);
  gridDrawer.draw(this.g);
  pandemicDrawer.draw(this.g);
  pandemicHaloDrawer.draw();
}
