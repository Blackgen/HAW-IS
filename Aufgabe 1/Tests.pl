% Autor:
% Datum: 07.03.2016

% :-begin_tests(integrety).
% test(integrety, fail) :- elternteil(X,Y),(not(mann(X);frau(X));not(mann(Y);frau(Y))),writeln(X),writeln(Y).
%
% test(integrety, true) :- elternteil(X, Y), ((mann(X);frau(X));mann(Y);frau(Y)), writeln(X), writeln(Y).
%
% test(true) :- vater(X, Y), writeln(X), writeln(Y).
%
% :-end_tests(integrety).

:-begin_tests(test).

test(a) :- assertion(not(mutter(delladuck, hans))).

test(b) :- assertion(vater(bardok, radditz)).

test(c) :- assertion(mutter(gine, son_goku)).

test(d) :- assertion(not(bruder(vegeta, son_goku))).

test(e) :- mutter(X, radditz), assertion(X == gine).

test(f) :- opa(X, pan), (assertion(X == son_goku);assertion(X == mr_satan)).

test(g) :- assertion(neffe(son_gohan, radditz)).

:-end_tests(test).