% Autor: Jan Bartels, Patrick Steinhauer
% Datum: 22.03.2016

transportiere(1, Von, _, Nach) :-
  write('Bringe eine Scheibe von '), write(Von), write(' nach '), write(Nach), write(.), nl.


transportiere(AnzahlScheiben, Anfang, Mitte, Ende) :-
  AnzahlScheiben > 1,
  ObereScheiben is AnzahlScheiben - 1,
  write('@ '),writeln(ObereScheiben),
  transportiere(ObereScheiben, Anfang, Ende, Mitte),
  transportiere(1, Anfang, Mitte, Ende),
  transportiere(ObereScheiben, Mitte, Anfang, Ende).

