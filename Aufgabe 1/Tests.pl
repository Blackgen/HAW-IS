% Autor:
% Datum: 07.03.2016

:-begin_tests(integrety).
test(integrety,fail) :- elternteil(X,Y),(not(mann(X);frau(X));not(mann(Y);frau(Y))),writeln(X),writeln(Y).

:-end_tests(integrety).