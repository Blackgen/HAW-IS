/**
 * Created by jandennis on 02.06.16.
 */
public class Edge {
  public String A;
  public String B;
  public CSP HOW;

  public Edge(String a, String b, CSP HOW) {
    A = a;
    B = b;
    this.HOW = HOW;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Edge edge = (Edge) o;

    if (A != null ? !A.equals(edge.A) : edge.A != null) return false;
    if (B != null ? !B.equals(edge.B) : edge.B != null) return false;
    return HOW == edge.HOW;

  }

  @Override
  public int hashCode() {
    int result = A != null ? A.hashCode() : 0;
    result = 31 * result + (B != null ? B.hashCode() : 0);
    result = 31 * result + (HOW != null ? HOW.hashCode() : 0);
    return result;
  }
}
