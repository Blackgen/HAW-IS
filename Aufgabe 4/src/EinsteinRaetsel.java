import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by jandennis on 02.06.16.
 */
public class EinsteinRaetsel {
  private static List<String> nationen = Arrays.asList(new String[]{"brite","schwede","daene","norweger","deutscher"});
  private static List<String> farben = Arrays.asList(new String[]{"rot","gruen","gelb","weiss","blau"});
  private static List<String> getranke = Arrays.asList(new String[]{"hund","vogel","katze","pferd","fisch"});
  private static List<String> tiere = Arrays.asList(new String[]{"tee","kaffee","milch","bier","wasser"});
  private static List<String> zigaretten = Arrays.asList(new String[]{"pallmall","dunhill","marlboro","winfield","rothmanns"});
  private static List<List<String>> all;

  public static void main(String[] args) {
    ConstraintSolver solver = new ConstraintSolver();
    all.add(nationen);
    all.add(farben);
    all.add(getranke);
    all.add(tiere);
    all.add(zigaretten);


    // Initialise
    for (List<String> list : all) {
      for (String elem : list) {
        solver.addVariable(elem, Arrays.asList(new Integer[]{1, 2, 3, 4, 5}));
      }
    }

    // Clues
    solver.addBidirectionalEdge("brite","rot",CSP.gleich);
    solver.addBidirectionalEdge("schwede","hund",CSP.gleich);
    solver.addBidirectionalEdge("daene","tee",CSP.gleich);
    solver.addEdge("gruen","weiss",CSP.linksvon);
    solver.addEdge("weiss","gruen",CSP.rechtsvon);
    solver.addBidirectionalEdge("gruen","kaffee",CSP.gleich);
    solver.addBidirectionalEdge("pallmall","vogel",CSP.gleich);
    solver.addEdge("milch","milch",CSP.mittleresHaus);
    solver.addBidirectionalEdge("gelb","dunhill",CSP.gleich);
    solver.addEdge("norweger","norweger",CSP.erstesHaus);
    solver.addBidirectionalEdge("malboro","katze",CSP.gleich);
    solver.addBidirectionalEdge("pferd","dunhill",CSP.gleich);
    solver.addBidirectionalEdge("windfield","bier",CSP.gleich);
    solver.addBidirectionalEdge("norweger","blau",CSP.neben);
    solver.addBidirectionalEdge("deutscher","rotmanns",CSP.gleich);
    solver.addBidirectionalEdge("malboro","wasser",CSP.neben);
  }
}
