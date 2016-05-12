
public class Palette {
  private color[] colors;

  Palette() {
    colors = new color[2];
    colors[0] = color(0);
    colors[1] = color(1);
  }

  public Palette load(String palettePath) {
    PImage paletteImg = loadImage(palettePath);
    colors = new color[paletteImg.width];
    paletteImg.loadPixels();
    for (int i = 0; i < colors.length; i++) {
      colors[i] = paletteImg.pixels[i];
    }
    return this;
  }

  public color get(float v) {
    return colors[floor(map(constrain(v, 0, 1), 0, 1, 0, colors.length-1))];
  }
}