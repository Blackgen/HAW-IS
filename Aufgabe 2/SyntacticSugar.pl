% Autor:
% Datum: 18.04.2016


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
nomen(SingularPlural)               --> [X], {lexi(X, nomen, SingularPlural)}.
praeposition                        --> [X], {lexi(X, praeposition)}.
verb(SingularPlural)                --> [X], {lexi(X, verb, SingularPlural)}.
interogativpronomen(SingularPlural) --> [X], {lexi(X, interogativpronomen, SingularPlural)}.
artikel(SingularPlural)             --> [X], {lexi(X, artikel, SingularPlural)}.