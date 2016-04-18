
public class HaloInfection {
  private HaloAgent agent;

  HaloInfection(HaloAgent agentArg) {
    agent = agentArg;
  }

  public HaloAgent agent() {
    return agent;
  }

  public HaloInfection step() {
    agent = getNextAgent(agent);
    return this;
  }

  private HaloAgent getNextAgent(HaloAgent agent) {
    HaloAgent nextAgent = null;
    while (nextAgent == null) {
      switch (floor(random(8))) {
        case 0:
          nextAgent = agent.nNeighbor();
          break;
        case 1:
          nextAgent = agent.neNeighbor();
          break;
        case 2:
          nextAgent = agent.eNeighbor();
          break;
        case 3:
          nextAgent = agent.seNeighbor();
          break;
        case 4:
          nextAgent = agent.sNeighbor();
          break;
        case 5:
          nextAgent = agent.swNeighbor();
          break;
        case 6:
          nextAgent = agent.wNeighbor();
          break;
        case 7:
          nextAgent = agent.nwNeighbor();
          break;
      }
    }
    return nextAgent;
  }
}
