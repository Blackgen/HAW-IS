% Autor:
% Datum: 07.03.2016

:-begin_tests(integrety).
test(integrety) :- elternteil(X,Y),
                   (mann(X);frau(X)),
                   (mann(Y);frau(Y)),!.

:-end_tests(integrety).