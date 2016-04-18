% Autor:
% Datum: 18.04.2016

:- consult('readsentence').
:- consult('../Aufgabe 1/StammbaumDucks').
:- consult('../Aufgabe 1/Verwandtschaftsbeziehungen').
:- consult('Satzbausteine').

eingabe :- read_sentence(Satz), frage(Satz,S, []).

frage(Satz) --> nominalphrase(SatzNP, SingularPlural), verbalphrase(SatzVP, SingularPlural), {SatzVP = [_,SatzNP|_], Satz =.. SatzVP}.

nominalphrase(SatzNP, SingularPlural) --> eigenname.
nominalphrase(SatzNP, SingularPlural) --> artikel(SatzNP, SingularPlural), nomen(SatzNP, SingularPlural).
nominalphrase(SatzNP, SingularPlural) --> artikel(SatzNP, SingularPlural), nomen(SatzNP, SingularPlural), prapositionalphrase(SatzNP, SingularPlural).
praepositionalphrase(SatzPP, SingularPlural) --> praeposition, nominalphrase(SatzPP, SingularPlural).
praepositionalphrase(SatzPP, SingularPlural) --> praeposition, eigenname, artikel(SatzPP, SingularPlural), nomen(SatzPP, SingularPlural).
verbalphrase(SatzVP, SingularPlural) --> verb(SatzVP, SingularPlural).
verbalphrase(SatzVP, SingularPlural) --> verb(SatzVP, SingularPlural), nominalphrase(SatzVP, SingularPlural).

eigenname                                   --> [X], {mann(X);frau(X)}.
nomen(Semantik, SingularPlural)               --> [X], {lexi(X, Semantik, nomen, SingularPlural)}.
praeposition                                  --> [X], {lexi(X, praeposition)}.
verb(Semantik, SingularPlural)                --> [X], {lexi(X, Semantik, verb, SingularPlural)}.
interogativpronomen(Semantik, SingularPlural) --> [X], {lexi(X, Semantik, interogativpronomen, SingularPlural)}.
artikel(Semantik, SingularPlural)             --> [X], {lexi(X, Semantik, artikel, SingularPlural)}.