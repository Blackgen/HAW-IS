% Autor:
% Datum: 24.03.2016

:- consult('readsentence').
:- consult('../Aufgabe 1/StammbaumDucks').
:- consult('../Aufgabe 1/Verwandtschaftsbeziehungen').
:- consult('Satzbausteine').

fragestellen :- read_sentence(X),frage(X,[('.')]).

satz(NP,VP) :-  nominalphrase(NP,NR), verbalphrase(NR,VP).
                
frage(F,R) :- fragewort(F,FR),verbalphrase(FR,VR,Bez), praepositionalphrase(VR,R,Sub),
              Anfrage =.. [Bez,X,Sub],findall(X,Anfrage,L),writeln(L).
frage(F,R) :- verbalphrase(F,VBR,SubA), nominalphrase(VBR,NPR,Bez),praepositionalphrase(NPR,R,SubB),
              Anfrage =.. [Bez,SubA,SubB], Anfrage.

% nominalphrase( Eingangsliste, Ausgangsliste, Nomen)
nominalphrase(N,Rest,Sub) :- eigenname(N,Rest,Sub).
nominalphrase(A,Rest,Sub) :- artikel(A,R), nomen(R,Rest,Sub).
nominalphrase(N,Rest,Sub) :- nomen(N,Rest,Sub).

%verbalphrase(VP,R) :- verb(VP,R).
verbalphrase(V,R,Sub) :- verb(V,NP), nominalphrase(NP,R,Sub).

praepositionalphrase(PP,PR,Sub) :- praeposition(PP,PosR),eigenname(PosR,PR,Sub).

% ------------------------------------------------------------------------------

eingabe :- read_sentence(Satz), frage(Satz, []).

frage() --> .

nominalphrase() --> eigenname().
nominalphrase() --> artikel(), nomen().
nominalphrase() --> artikel(), nomen(), prapositionalphrase().
praepositionalphrase() --> praeposition(), nominalphrase().
praepositionalphrase() --> praeposition(), eigenname(), artikel(), nomen().
verbalphrase() --> verb().
verbalphrase() --> verb(), nominalphrase().
eigenname() --> x.
nomen(SingularPlural) --> [X], {lexi(X, nomen, SingularPlural)}.
praeposition --> [X], {lexi(X, praeposition)}.
verb(SingularPlural) --> [X], {lexi(X, verb, SingularPlural)}.
interogativpronomen(SingularPlural) --> [X], {lexi(X, interogativpronomen, SingularPlural)}.
artikel(SingularPlural) --> [X], {lexi(X, artikel, SingularPlural)}.
