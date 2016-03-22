% Autor:
% Datum: 07.03.2016

:-begin_tests(integrety).
test(integrety, fail) :- elternteil(X,Y),(not(mann(X);frau(X));not(mann(Y);frau(Y))),writeln(X),writeln(Y).

:-end_tests(integrety).


:-begin_tests(dragonball).

test(a) :- assertion(not(mutter(delladuck, hans))).

test(b) :- assertion(vater(bardok, radditz)).

test(c) :- assertion(mutter(gine, son_goku)).

test(d) :- assertion(not(bruder(vegeta, son_goku))).

test(e) :- mutter(X, radditz), assertion(X == gine).

test(f) :- opa(X, pan), (assertion(X == son_goku);assertion(X == mr_satan)).

test(g) :- assertion(neffe(son_gohan, radditz)).

test(halbgeschwister) :- assertion((halbgeschwister(garumex,son_goten),
                                 not(geschwister(garumex,son_goten)))).
                                 
test(keinegeschwister, fail) :- geschwister(garumex, X).

:-end_tests(dragonball).