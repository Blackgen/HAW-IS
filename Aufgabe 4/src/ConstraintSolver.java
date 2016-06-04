import java.util.*;

/**
 * Created by jandennis on 02.06.16.
 */
public class ConstraintSolver {
  private Map<String, List<Integer>> variablen = new HashMap<>();
  private Set<Edge> edges =new HashSet<>();

  public void addVariable(String elem, List<Integer> integers) {
    variablen.put(elem, integers);
  }


  public void addEdge(String a, String b, CSP how) {
    edges.add(new Edge(a,b,how));
  }

  public void addBidirectionalEdge(String a, String b, CSP how) {
    addEdge(a,b,how);
    addEdge(b,a,how);
  }

  public void allDifferent(List<String> array) {
    for (String elem :array) {
      for (String elem2: array) {
        if(!elem.equals(elem2)) addBidirectionalEdge(elem,elem2,CSP.ungleich);
      }
    }
  }

  public void solve() {
    Queue<Edge> queue = new LinkedList(edges);
    while (!queue.isEmpty()) {
      Edge e = queue.poll();
      if (revise(e)) {

      }
    }
  }

  private boolean revise(Edge edge) {
    boolean action = false;
    for(Integer value : variablen.get(edge.A)) {
      if (!isValuePossible(edge,value)) {
        action = true;
        variablen.get(edge).remove(value);
      }
    }
    return action;
  }

  private boolean isValuePossible(Edge edge, Integer value) {
    for(Integer value2 : variablen.get(edge.B)) {
      if (ConstraintChecker.check(edge.HOW,value,value2)) {
        return true;
      }
    }
  return false;
  }
}