package complex.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by JanDennis on 04.06.2016.
 */
public class Knoten {
  private String name;
  private List<Integer> domain;
  private Set<Kante> ausgehendeKanten = new HashSet<>();
  private Set<Kante> eintreffendeKanten = new HashSet<>();

  public Knoten(String name, List<Integer> domain) {
    this.name = name;
    this.domain = domain;
  }

  public void addOutgoingEdge(Kante kante) {
    ausgehendeKanten.add(kante);
  }

  public void addIncomingEdge(Kante kante) {
    eintreffendeKanten.add(kante);
  }

  public String getName() {
    return name;
  }

  public List<Integer> getDomain() {
    return domain;
  }

  public Set<Kante> getAusgehendeKanten() {
    return ausgehendeKanten;
  }

  public Set<Kante> getEintreffendeKanten() {
    return eintreffendeKanten;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Knoten knoten = (Knoten) o;

    return name != null ? name.equals(knoten.name) : knoten.name == null;

  }

  @Override
  public int hashCode() {
    return name != null ? name.hashCode() : 0;
  }
}
