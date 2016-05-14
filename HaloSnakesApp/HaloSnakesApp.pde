
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

DrawConfig config;
int snakeCount;
HaloGrid grid;
HaloGridDrawer gridDrawer;
SnakePit snakePit;
SnakePitDrawer snakePitDrawer;
Halo halo;
SnakePitHaloDrawer snakePitHaloDrawer;

boolean isPaused;

void setup() {
  size(640, 480);

  isPaused = true;

  config = new DrawConfig()
    .cellSize(40);

  grid = new HaloGrid(12, 6);
  gridDrawer = new HaloGridDrawer(grid, config);

  snakeCount = 1;
  snakePit = new SnakePit(grid, snakeCount);
  snakePitDrawer = new SnakePitDrawer(snakePit, config);

  halo = new Halo(
      new OscP5(this, 12000),
      new NetAddress("192.168.3.50", 1314));

  snakePitHaloDrawer = new SnakePitHaloDrawer(snakePit, halo);

  redraw();
}

void draw() {
  if (!isPaused) {
    snakePit.step();
    redraw();
  }
}

void reset() {
  snakePit = new SnakePit(grid, snakeCount);
  snakePitDrawer = new SnakePitDrawer(snakePit, config);
  snakePitHaloDrawer = new SnakePitHaloDrawer(snakePit, halo);
}

void redraw() {
  background(0);
  gridDrawer.draw(this.g);
  snakePitDrawer.draw(this.g);
  snakePitHaloDrawer.draw();
}

void step(int n) {
  for (int i = 0; i < n; i++) {
    snakePit.step();
  }
}

void keyReleased() {
  switch (key) {
    case 'd':
      snakePitDrawer.isDebug(!snakePitDrawer.isDebug());
      break;
    case 'p':
      isPaused = !isPaused;
      break;
    case ' ':
      step(1);
      redraw();
      break;
    case '1':
      step(5);
      redraw();
      break;
    case '2':
      step(10);
      redraw();
      break;
    case '3':
      step(20);
      redraw();
      break;
    case '4':
      step(30);
      redraw();
      break;
    case '5':
      step(50);
      redraw();
      break;
    case 'r':
      reset();
      redraw();
      break;
  }
}
