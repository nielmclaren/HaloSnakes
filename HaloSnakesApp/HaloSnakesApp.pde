
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

HaloGrid grid;
HaloGridDrawer gridDrawer;
SnakePit snakePit;
SnakePitDrawer snakePitDrawer;
Halo halo;
SnakePitHaloDrawer snakePitHaloDrawer;

void setup() {
  size(640, 480);

  DrawConfig config = new DrawConfig()
    .cellSize(40);

  grid = new HaloGrid(12, 6);
  gridDrawer = new HaloGridDrawer(grid, config);

  int snakeCount = 4;
  snakePit = new SnakePit(grid, snakeCount);
  snakePitDrawer = new SnakePitDrawer(snakePit, config);

  halo = new Halo(
      new OscP5(this, 12000),
      new NetAddress("127.0.0.1", 1314));

  snakePitHaloDrawer = new SnakePitHaloDrawer(snakePit, halo);
}

void draw() {
  if (frameCount % 5 == 0) {
    snakePit.step();
  }

  background(0);
  gridDrawer.draw(this.g);
  snakePitDrawer.draw(this.g);
  snakePitHaloDrawer.draw();
}