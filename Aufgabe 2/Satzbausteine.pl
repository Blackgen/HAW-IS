% Autor:
% Datum: 24.03.2016



eigenname([X|R],R,X) :- (mann(X);frau(X)).

artikel([A|R],R) :- lex(art,A).

verb([V|R],R) :- lex(verb,V).

nomen([N|R],R,N):- lex(nomen,N).

fragewort([F|R],R) :- lex(frage,F).

praeposition([P|R],R) :- lex(pre,P).




%lex(wortart,wort)
%lex(wortart,wort,abart,abartart)

lex(verb,geht).

lex(art,der).
lex(art,die).
lex(art,das).
lex(art,dem).
lex(art,den).

lex(frage,wer).
lex(frage,wie).
lex(frage,was).

lex(nomen,vater).
lex(nomen,mutter).
lex(nomen,onkel).
lex(nomen,tante).
lex(nomen,neffe).
lex(nomen,nichte).
lex(nomen,sohn).
lex(nomen,tochter).
lex(nomen,opa).
lex(nomen,oma).
lex(nomen,vorfahre).
lex(nomen,geschwister).
lex(nomen,halbgeschwister).
lex(nomen,cousin).
lex(nomen,cousine).


lex(verb,ist).

lex(pre,von).

% ------------------------------------------------------------------------------

% Interogativpronomen
lexi(wer, interogativpronomen).
lexi(wie, interogativpronomen).
lexi(was, interogativpronomen).

% Verben
lexi(ist, , ist, verb, singular).
lexi(sind, sind, verb, plural).
lexi(hat, , hat, verb, singular).

% Praepositionen
lexi(von, praeposition)

% Artikel
lexi(der, artikel, singular).
lexi(die, artikel, singular).
lexi(die, artikel, plural).

% Nomen Singular
lexi(onkel, onkel).
lexi(tante, tante).
lexi(opa, opa).
lexi(oma, oma).
lexi(vater, vater).
lexi(mutter, vater).
lexi(schwester, schwester).
lexi(bruder, bruder).
lexi(halbschwester, halbschwester).
lexi(halbbruder, halbbruder).
lexi(uroma, uroma).
lexi(uropa, uroma).
lexi(cousin, cousin).
lexi(cousine, cousine).
lexi(nichte, nichte).
lexi(neffe, neffe).

% Nomen Plural
% Vaeter und Muetter vielleicht nur wenn man von mehreren verschiedenen Kindern
% jeweils Vater und Mutter haben moechte.
lexi(onkel, onkel).
lexi(tanten, tanten).
lexi(opis, opis).
lexi(omis, omis).
lexi(vaeter, vaeter).
lexi(muetter, muetter).
lexi(uropis, uropis).
lexi(uromis, uromis).
lexi(neffen, neffen).
lexi(nichten, nichten).
lexi(halbschwestern, halbschwestern).
lexi(halbbrueder, halbbrueder).
lexi(brueder, brueder).
lexi(schwestern, schwestern).
lexi(cousins, cousins).
lexi(cousinen, cousinen).
