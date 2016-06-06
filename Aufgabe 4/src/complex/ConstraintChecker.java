package complex;

import complex.data.Constraint;

/**
 * Created by JanDennis on 04.06.2016.
 */
public class ConstraintChecker {
  public static boolean check(Constraint how, Integer value1, Integer value2) {
    switch (how) {
      case gleich:
        return value1.intValue() == value2.intValue();

      case ungleich:
        return (value1.intValue() != value2.intValue());

      case linksvon:
        return value1.intValue() == value2.intValue() - 1;

      case rechtsvon:
        return value1.intValue() == value2.intValue() + 1;

      case neben:
        return (Math.abs(value1.intValue() - value2.intValue()) == 1);

      case mittleresHaus:
        return value1.intValue() == 2;

      case erstesHaus:
        return value1.intValue() == 0;

      default:
        throw new RuntimeException("WRONG CHECK " + how);
    }
  }
}
