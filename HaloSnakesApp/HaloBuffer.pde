
public class HaloBuffer {
  private int width;
  private int height;
  private int depth;
  private color[][] buffers;
  private int currBuffer;
  private Halo halo;

  HaloBuffer(HaloGrid grid, Halo haloArg) {
    width = grid.width();
    height = grid.height();
    depth = grid.depth();
    buffers = createBuffers();
    halo = haloArg;
  }

  private color[][] createBuffers() {
    color[][] result = new color[2][width * height * depth];
    for (int b = 0; b < 2; b++) {
      for (int i = 0; i < width * height * depth; i++) {
        result[b][i] = 0x000000;
      }
    }
    return result;
  }

  public void setAll(color c) {
    for (int i = 0; i < width * height * depth; i++) {
      buffers[currBuffer][i] = c;
    }
  }

  public color getLed(int x, int y, int z) {
    return getLed(currBuffer, x, y, z);
  }

  private color getLed(int b, int x, int y, int z) {
    return buffers[b][y * width * depth + x * depth + z];
  }

  public void setLed(int x, int y, int z, color c) {
    setLed(currBuffer, x, y, z, c);
  }

  private void setLed(int b, int x, int y, int z, color c) {
    buffers[b][y * width * depth + x * depth + z] = c;
  }

  public void setHalo(int x, int y, color c) {
    for (int z = 0; z < depth; z++) {
      setLed(x, y, z, c);
    }
  }

  public void addLed(int x, int y, int z, color c) {
    color d = getLed(x, y, z);
    float r = min(255, red(c) + red(d));
    float g = min(255, green(c) + green(d));
    float b = min(255, blue(c) + blue(d));
    setLed(x, y, z, color(r, g, b));
  }

  public HaloBuffer flush() {
    int otherBuffer = 1 - currBuffer;
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        for (int z = 0; z < depth; z++) {
          if (isBufferChanged(x, y, z)) {
            halo.controlLed(x, y, z, getLed(x, y, z), 0.2);
          }
        }
      }
    }
    swapBuffers();

    return this;
  }

  private boolean isBufferChanged(int x, int y, int z) {
    int otherBuffer = 1 - currBuffer;
    return getLed(currBuffer, x, y, z) != getLed(otherBuffer, x, y, z);
  }

  private void swapBuffers() {
    currBuffer = 1 - currBuffer;
  }
}
