import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jandennis on 02.06.16.
 */
public class ConstraintSolver {
  private Map<String, List<Integer>> variablen = new HashMap<>();
  private List<Edge> edges =new ArrayList<>();

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

}