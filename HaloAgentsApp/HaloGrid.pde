
public class HaloGrid {
  private int width;
  private int height;

  private HaloAgent[][] grid;

  HaloGrid(int w, int h) {
    width = w;
    height = h;
    grid = new HaloAgent[width][height];

    createHaloAgents();
    setHaloAgentNeighbors();
  }

  public HaloAgent get(int x, int y) {
    return grid[x][y];
  }

  public int width() {
    return width;
  }

  public int height() {
    return height;
  }

  private void createHaloAgents() {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        grid[x][y] = new HaloAgent(x, y);
      }
    }
  }

  private void setHaloAgentNeighbors() {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        HaloAgent agent = grid[x][y];
        setHaloAgentNeighbors(x, y);
      }
    }
  }

  private void setHaloAgentNeighbors(int x, int y) {
    int minX = max(x - 1, 0);
    int maxX = min(x + 2, width);
    int minY = max(y - 1, 0);
    int maxY = min(y + 2, height);

    for (int neighborX = minX; neighborX < maxX; neighborX++) {
      for (int neighborY = minY; neighborY < maxY; neighborY++) {
        if (x == neighborX && y == neighborY) {
          continue;
        }

        setHaloAgentNeighbors(x, y, neighborX, neighborY);
      }
    }
  }

  private void setHaloAgentNeighbors(int x, int y, int neighborX, int neighborY) {
    HaloAgent agent = grid[x][y];
    HaloAgent neighbor = grid[neighborX][neighborY];

    if (neighborX < x) {
      if (neighborY < y) {
        agent.nwNeighbor(neighbor);
      }
      else if (neighborY == y) {
        agent.wNeighbor(neighbor);
      }
      else {
        agent.swNeighbor(neighbor);
      }
    }
    else if (neighborX == x) {
      if (neighborY < y) {
        agent.nNeighbor(neighbor);
      }
      else {
        agent.sNeighbor(neighbor);
      }
    }
    else {
      if (neighborY < y) {
        agent.neNeighbor(neighbor);
      }
      else if (neighborY == y) {
        agent.eNeighbor(neighbor);
      }
      else {
        agent.seNeighbor(neighbor);
      }
    }
  }
}
