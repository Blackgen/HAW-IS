package complex;

import complex.data.Constraint;
import complex.data.Kante;
import complex.data.Knoten;

import java.util.Arrays;
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
    solver.addBiConstraint(brite,rot, Constraint.gleich);
    solver.addBiConstraint(schwede,hund,Constraint.gleich);
    solver.addBiConstraint(daene,tee,Constraint.gleich);
    solver.addUnaryConstraint(gruen,weiss,Constraint.linksvon);
    solver.addUnaryConstraint(weiss,gruen,Constraint.rechtsvon);
    solver.addBiConstraint(gruen,kaffee,Constraint.gleich);
    solver.addBiConstraint(pallmall,vogel,Constraint.gleich);
    solver.addUnaryConstraint(milch,milch,Constraint.mittleresHaus);
    solver.addBiConstraint(gelb,dunhill,Constraint.gleich);
    solver.addUnaryConstraint(norweger,norweger,Constraint.erstesHaus);
    solver.addBiConstraint(malboro,katze,Constraint.gleich);
    solver.addBiConstraint(pferd,dunhill,Constraint.gleich);
    solver.addBiConstraint(winfield,bier,Constraint.gleich);
    solver.addBiConstraint(norweger,blau,Constraint.neben);
    solver.addBiConstraint(deutscher,rothmanns,Constraint.gleich);
    solver.addBiConstraint(malboro,wasser,Constraint.neben);

    solver.allDifferent(Arrays.asList(new Knoten[]{brite,schwede,daene,norweger,deutscher}));
    solver.allDifferent(Arrays.asList(new Knoten[]{rot,gruen,gelb,weiss,blau}));
    solver.allDifferent(Arrays.asList(new Knoten[]{hund,vogel,katze,pferd,fisch}));
    solver.allDifferent(Arrays.asList(new Knoten[]{tee,kaffee,milch,bier,wasser}));
    solver.allDifferent(Arrays.asList(new Knoten[]{pallmall,dunhill,malboro,winfield,rothmanns}));
  }
  
  
  
  
  
  private List<Integer> getDomain() {
    return Arrays.asList(new Integer[]{1,2,3,4,5});
  }
}
