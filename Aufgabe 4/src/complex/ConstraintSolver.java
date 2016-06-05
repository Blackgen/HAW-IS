package complex;

import complex.data.Constraint;
import complex.data.Kante;
import complex.data.Knoten;

import java.util.*;

/**
 * Created by JanDennis on 04.06.2016.
 */
public class ConstraintSolver {
  private Set<Knoten> knoten = new HashSet<>();
  private Set<Kante> kanten = new HashSet<>();

  public Knoten addVariable(String name, List<Integer> dom) {
    Knoten k = new Knoten(name, dom);
    knoten.add(k);
    return k;
  }

  public void addUnaryConstraint(Knoten from, Knoten to, Constraint constraint) {
    kanten.add(new Kante(from, to, constraint));
  }

  public void addBiConstraint(Knoten a, Knoten b, Constraint constraint) {
    addUnaryConstraint(a, b, constraint);
    addUnaryConstraint(b, a, constraint);
  }

  public void allDifferent(Collection<Knoten> knoten) {
    for (Knoten elem : knoten) {
      for (Knoten elem2 : knoten) {
        if (!elem.equals(elem2)) addBiConstraint(elem, elem2, Constraint.ungleich);
      }
    }
  }

  // Solving stuff:
  private Set<Kante> getEintreffendeKanten(Knoten knoten) {
    return knoten.getEintreffendeKanten();
  }

  private Set<Kante> getAusgehendeKanten(Knoten knoten) {
    return knoten.getAusgehendeKanten();
  }

  public void ac3la() {
    Queue<Kante> queue = new LinkedList<>(kanten);
    while (!queue.isEmpty()) {
      Kante kante = queue.poll();
      if (revise(kante)) {

      }
    }
  }

  public void ac3() {
    Queue<Kante> queue = new LinkedList<>(kanten);
    while(!queue.isEmpty()) {
      Kante delete = queue.poll();
      if(revise(delete)) {
        Set<Knoten> knoten = delete.getStart().getNachbarn();
        for (Knoten k :knoten) {
          Iterator<Kante> kantenIterator = k.getAusgehendeKanten().iterator();
          if(kantenIterator.hasNext()) {
            Kante kante = kantenIterator.next();
            queue.add(kante);
          }
        }
      }
    }
  }

  private boolean revise(Kante edge) {
    boolean action = false;
    for(Integer value : edge.getStart().getDomain()) {
      if (!isValuePossible(edge,value)) {
        action = true;
        edge.getStart().getDomain().remove(value);
      }
    }
    return action;
  }

  private boolean isValuePossible(Kante edge, Integer value) {
    for(Integer value2 : edge.getEnde().getDomain()) {
      if (ConstraintChecker.check(edge.getConstraint(),value,value2)) {
        return true;
      }
    }
    return false;
  }
}
