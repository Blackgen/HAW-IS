% Author: Jan Bartels
% Datum: 07.03.2016

% Vater: X ist Vater von Y
vater(X,Y) :- mann(X), elternteil(X,Y).
 
% Mutter: X ist Mutter von Y
mutter(X,Y) :- frau(X), elternteil(X,Y).


% Groﬂelternteil: X ist Elternteil vom Elternteil von Y
groﬂelternteil(X,Y) :- elternteil(X,Z), elternteil(Z,Y).

% Opa: X ist Opa von Y
opa(X,Y) :- mann(x), groﬂelternteil(X,Y).

% Oma: X ist Oma von Y
oma(X,Y) :- frau(X), groﬂelternteil(X,Y).


% Vorfahre: X ist ein Vorfahre von Y
vorfahre(X,Y) :- elternteil(X,Y).
vorfahre(X,Y) :- elternteil(X,Z), vorfahre(Z,Y).


% Geschwister: X ist Geschwisterteil von Y, gleiche Mutter & Vater
geschwister(X,Y) :- vater(V,X), vater(V,Y),
                    mutter(M,X), mutter(M,Y), X \= Y.
                    
% Halbgeschwister: Gleicher Vater oder gleiche Mutter
halbgeschwister(X,Y) :- vater(V,X), vater(V,Y), X \= Y, not(geschwister(X,Y)).
halbgeschwister(X,Y) :- mutter(M,X), mutter(M,Y), X \= Y, not(geschwister(X,Y)).

% Bruder: X ist Bruder von Y
bruder(X,Y) :- geschwister(X,Y), mann(X).

% Schwester: X ist Schwester von Y
schwester(X,Y) :- geschwister(X,Y), frau(X).

% Onkel: X ist Onkel von Y
onkel(X,Y) :- elternteil(Z,Y), bruder(X,Z).

% Tante: X ist Tante von Y
tante(X,Y) :- elternteil(X,Y), schwester(X,Z).