% Author: Jan Bartels
% Datum: 07.03.2016

% Vater: X ist Vater von Y
vater(X,Y) :- mann(X), elternteil(X,Y).
 
% Mutter: X ist Mutter von Y
mutter(X,Y) :- frau(X), elternteil(X,Y).


% Großelternteil: X ist Elternteil vom Elternteil von Y
großelternteil(X,Y) :- elternteil(X,Z), elternteil(Z,Y).

% Opa: X ist Opa von Y
opa(X,Y) :- mann(x), großelternteil(X,Y).