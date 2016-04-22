% Autor:
% Datum: 18.04.2016

:- consult('readsentence').
:- consult('../../Aufgabe 1/StammbaumDucks').
:- consult('../../Aufgabe 1/Verwandtschaftsbeziehungen').
:- consult('Satzbausteine').

eingabe :- read_sentence(Satz), frage(_, Satz, ['.']).

frage(Satz) --> nominalphrase(SatzNP, SingularPlural), verbalphrase(SatzVP, SingularPlural).
frage(Satz) --> verb(SatzVerb, SingularPlural), nominalphrase(SatzNP, SingularPlural), nominalphrase([SatzNP2, Rest], SingularPlural), {FF=.. [SatzNP2, X, Rest], FF, X == SatzNP,write("In der Tat")}.
frage(Satz) --> iterogativphrase(SatzIP, SingularPlural), nominalphrase(SatzNP, SingularPlural), praepositionalphrase(SatzPP, SingularPlural),
                {F=.. [SatzNP, X, SatzPP], findall(X,F,L), antwort(SingularPlural,L,SatzPP,SatzNP,X,[]),myprint(X)}.


antwort(Geschlecht,[Gefunden],Gesucht,Verhaltnis) --> nominalphrase(Verhaltnis,Geschlecht), praepositionalphrase(Gesucht,Geschlecht),verb(_,Geschlecht),nominalphrase(Gefunden,Geschlecht).
antwort(Geschlecht,Array,Gesucht,Verhaltnis) --> nominalphrase(Verhaltnis,Geschlecht), praepositionalphrase(Gesucht,Geschlecht),verb(_,Geschlecht),undverkettung(Array).

undverkettung([E|R]) --> eigenname(E),undverkettung_(R).
undverkettung_([E|R]) --> komma,eigenname(E),undverkettung_(R).
undverkettung_([E]) --> und,eigenname(E).

nominalphrase(SatzNP, _SingularPlural) --> eigenname(SatzNP).
nominalphrase(SatzNP, SingularPlural) --> artikel(SingularPlural), nomen(SatzNP, SingularPlural).
nominalphrase([SatzNP,SatzPP], SingularPlural) --> artikel(SingularPlural), nomen(SatzNP, SingularPlural), praepositionalphrase(SatzPP, SingularPlural).

praepositionalphrase(SatzPP, SingularPlural) --> praeposition, nominalphrase(SatzPP, SingularPlural).
%praepositionalphrase(SatzPP, SingularPlural) --> praeposition, eigenname(SatzPP), artikel, nomen(SatzPP, SingularPlural).

verbalphrase(SatzVP, SingularPlural) --> verb(SatzVP, SingularPlural).
verbalphrase(SatzVP, SingularPlural) --> verb(SatzVP, SingularPlural), nominalphrase(SatzVP, SingularPlural).

iterogativphrase(Semantik, SingularPlural)  --> iterogativpronomen, verb(Semantik, SingularPlural) .

eigenname(X)                                  --> [X], {mann(X)}.
eigenname(X)                                  --> [X], {frau(X)}.
nomen(Semantik, SingularPlural)               --> [X], {lexi(Semantik, X, nomen, SingularPlural)}.
praeposition                                  --> [X], {lexi(X, praeposition)}.
verb(Semantik, SingularPlural)                --> [X], {lexi(Semantik, X, verb, SingularPlural)}.
iterogativpronomen                            --> [X], {lexi(X, iterogativpronomen)}.
artikel(Geschlecht)                           --> [X], {lexi(X, artikel,Geschlecht)}.
komma --> [","].
und --> [und].


myprint([E|L]) :- write(E),write(" "),myprint(L).
myprint([]):- write(".").