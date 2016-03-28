% Author: Jan Bartels
% Datum: 07.03.2016

% Vater: X ist Vater von Y
vater(X,Y) :- elternteil(X,Y), mann(X).
 
% Mutter: X ist Mutter von Y
mutter(X,Y) :- elternteil(X,Y), frau(X).

%Sohn: X ist Sohn von Y
sohn(X,Y):- elternteil(Y,X),mann(X).

%Tochter: X ist Tochter von Y
tochter(X,Y):- elternteil(Y,X),tochter(X).


% Groﬂelternteil: X ist Elternteil vom Elternteil von Y
groﬂelternteil(X,Y) :- elternteil(X,Z), elternteil(Z,Y).

% Opa: X ist Opa von Y
opa(X,Y) :-  groﬂelternteil(X,Y), mann(X).

% Oma: X ist Oma von Y
oma(X,Y) :-  groﬂelternteil(X,Y), frau(X).

% Uropa: X ist Uropa von Y
uropa(X, Y) :-  mann(X), vater(Z, Y), opa(X, Z).
uropa(X, Y) :-  mann(X), mutter(Z, Y), opa(X, Z).

% Uroma: X ist Uroma von Y
uroma(X, Y) :-  frau(X), vater(Z, Y), oma(X, Z).
uroma(X, Y) :-  frau(X), mutter(Z, Y), oma(X, Z).

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
tante(X,Y) :- elternteil(Z,Y), schwester(X,Z).

% Neffe: X ist Neffe von Y
neffe(X,Y) :- onkel(Y,X).

%Nichte: X ist Nichte von Y
nichte(X,Y) :- tante(Y,X).

%Cousin: X ist Cousin von Y
cousin(X,Y) :- onkel(Z,Y), sohn(X,Z).
cousin(X,Y) :- tante(Z,Y), sohn(X,Z).

%Cousine: X ist Cousine von Y
cousine(X,Y) :- onkel(Z,Y), tochter(X,Z).
cousine(X,Y) :- tante(Z,Y), tochter(X,Z).