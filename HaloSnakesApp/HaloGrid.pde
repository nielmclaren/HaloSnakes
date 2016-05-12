
public class HaloGrid {
  private int width;
  private int height;

  private HaloCell[][] grid;

  HaloGrid(int w, int h) {
    width = w;
    height = h;
    grid = new HaloCell[width][height];

    createHaloCells();
    setHaloCellNeighbors();
  }

  public HaloCell get(int x, int y) {
    return grid[x][y];
  }

  public int width() {
    return width;
  }

  public int height() {
    return height;
  }

  private void createHaloCells() {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        grid[x][y] = new HaloCell(x, y);
      }
    }
  }

  private void setHaloCellNeighbors() {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        HaloCell cell = grid[x][y];
        setHaloCellNeighbors(x, y);
      }
    }
  }

  private void setHaloCellNeighbors(int x, int y) {
    int minX = max(x - 1, 0);
    int maxX = min(x + 2, width);
    int minY = max(y - 1, 0);
    int maxY = min(y + 2, height);

    for (int neighborX = minX; neighborX < maxX; neighborX++) {
      for (int neighborY = minY; neighborY < maxY; neighborY++) {
        if (x == neighborX && y == neighborY) {
          continue;
        }

        setHaloCellNeighbors(x, y, neighborX, neighborY);
      }
    }
  }

  private void setHaloCellNeighbors(int x, int y, int neighborX, int neighborY) {
    HaloCell cell = grid[x][y];
    HaloCell neighbor = grid[neighborX][neighborY];

    if (neighborX < x) {
      if (neighborY < y) {
        cell.nwNeighbor(neighbor);
      }
      else if (neighborY == y) {
        cell.wNeighbor(neighbor);
      }
      else {
        cell.swNeighbor(neighbor);
      }
    }
    else if (neighborX == x) {
      if (neighborY < y) {
        cell.nNeighbor(neighbor);
      }
      else {
        cell.sNeighbor(neighbor);
      }
    }
    else {
      if (neighborY < y) {
        cell.neNeighbor(neighbor);
      }
      else if (neighborY == y) {
        cell.eNeighbor(neighbor);
      }
      else {
        cell.seNeighbor(neighbor);
      }
    }
  }
}
