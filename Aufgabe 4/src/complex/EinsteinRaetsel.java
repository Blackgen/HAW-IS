package complex;

import complex.data.Constraint;
import complex.data.Kante;
import complex.data.Knoten;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by JanDennis on 05.06.2016.
 */
public class EinsteinRaetsel {
  ConstraintSolver solver = new ConstraintSolver();
  // Nationen
  private final Knoten deutscher = solver.addVariable("deutscher",getDomain());
  private final Knoten brite = solver.addVariable("brite",getDomain());
  private final Knoten daene = solver.addVariable("daene",getDomain());
  private final Knoten norweger = solver.addVariable("norweger",getDomain());
  private final Knoten schwede = solver.addVariable("schwede",getDomain());
  //Farben
  private final Knoten blau = solver.addVariable("blau",getDomain());
  private final Knoten gruen = solver.addVariable("gruen",getDomain());
  private final Knoten gelb = solver.addVariable("gelb",getDomain());
  private final Knoten weiss = solver.addVariable("weiss",getDomain());
  private final Knoten rot = solver.addVariable("rot",getDomain());
  //Getränke
  private final Knoten bier = solver.addVariable("bier",getDomain());
  private final Knoten tee = solver.addVariable("tee",getDomain());
  private final Knoten milch = solver.addVariable("milch",getDomain());
  private final Knoten kaffee = solver.addVariable("kaffee",getDomain());
  private final Knoten wasser = solver.addVariable("wasser",getDomain());
  //Tiere
  private final Knoten hund = solver.addVariable("hund",getDomain());
  private final Knoten katze = solver.addVariable("katze",getDomain());
  private final Knoten fisch = solver.addVariable("fisch",getDomain());
  private final Knoten vogel = solver.addVariable("vogel",getDomain());
  private final Knoten pferd = solver.addVariable("pferd",getDomain());
  //Zigaretten
  private final Knoten pallmall = solver.addVariable("pallmall",getDomain());
  private final Knoten dunhill = solver.addVariable("dunhill",getDomain());
  private final Knoten malboro = solver.addVariable("malboro",getDomain());
  private final Knoten winfield = solver.addVariable("winfield",getDomain());
  private final Knoten rothmanns = solver.addVariable("rothmanns",getDomain());
  
  public void solve() {
    solver.addBiConstraint(norweger,norweger,Constraint.erstesHaus);   // 9
    solver.addBiConstraint(milch,milch,Constraint.mittleresHaus);      // 7

    solver.addBiConstraint(brite,rot, Constraint.gleich);                 // 1
    solver.addBiConstraint(schwede,hund,Constraint.gleich);               // 2
    solver.addBiConstraint(daene,tee,Constraint.gleich);                  // 3
    solver.addUnaryConstraint(gruen,weiss,Constraint.linksvon);           // 4
    solver.addUnaryConstraint(weiss,gruen,Constraint.rechtsvon);          // 4
    solver.addBiConstraint(gruen,kaffee,Constraint.gleich);               // 5
    solver.addBiConstraint(pallmall,vogel,Constraint.gleich);             // 6
    solver.addBiConstraint(gelb,dunhill,Constraint.gleich);               // 8
    solver.addBiConstraint(malboro,katze,Constraint.neben);               // 10
    solver.addBiConstraint(winfield,bier,Constraint.gleich);              // 12
    solver.addBiConstraint(deutscher,rothmanns,Constraint.gleich);        // 14
    solver.addBiConstraint(pferd,dunhill,Constraint.neben);               // 11
    solver.addBiConstraint(norweger,blau,Constraint.neben);               // 13
    solver.addBiConstraint(malboro,wasser,Constraint.neben);              // 15

    solver.allDifferent(Arrays.asList(new Knoten[]{brite,schwede,daene,norweger,deutscher}));
    solver.allDifferent(Arrays.asList(new Knoten[]{rot,gruen,gelb,weiss,blau}));
    solver.allDifferent(Arrays.asList(new Knoten[]{hund,vogel,katze,pferd,fisch}));
    solver.allDifferent(Arrays.asList(new Knoten[]{tee,kaffee,milch,bier,wasser}));
    solver.allDifferent(Arrays.asList(new Knoten[]{pallmall,dunhill,malboro,winfield,rothmanns}));


//    solver.checkUnary();
//    solver.ac3();
    solver.solve(0);
    List<Knoten> de = new ArrayList<>();
    List<Knoten> nr = new ArrayList<>();
    List<Knoten> sw = new ArrayList<>();
    List<Knoten> dae = new ArrayList<>();
    List<Knoten> br = new ArrayList<>();

    for(Knoten k : solver.knoten) {
      if (k.getDomain().get(0) == 0) {
        de.add(k);
      } else if() {

      }
      System.out.println(k.toString());
    }
  }
  
  
  
  
  
  private List<Integer> getDomain() {
    return new LinkedList<>(Arrays.asList(new Integer[]{0,1,2,3,4}));
  }
}
