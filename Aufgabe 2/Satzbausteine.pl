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
lexi(ist, verb, singular).
lexi(sind, verb, plural).
lexi(hat, verb, singular).

% Praepositionen
lexi(von, praeposition)

% Artikel
lexi(der, artikel, singular).
lexi(die, artikel, singular).
lexi(die, artikel, plural).

% Nomen Singular
lexi(onkel).
lexi(tante).
lexi(opa).
lexi(oma).
lexi(vater).
lexi(mutter).
lexi(schwester).
lexi(bruder).
lexi(halbschwester).
lexi(halbbruder).
lexi(uroma).
lexi(uropa).
lexi(cousin).
lexi(cousine).
lexi(nichte).
lexi(neffe).

% Nomen Plural
% Vaeter und Muetter vielleicht nur wenn man von mehreren verschiedenen Kindern
% jeweils Vater und Mutter haben moechte.
lexi(onkel).
lexi(tanten).
lexi(opis).
lexi(omis).
lexi(vaeter).
lexi(muetter).
lexi(uropis).
lexi(uromis).
lexi(neffen).
lexi(nichten).
lexi(halbschwestern).
lexi(halbbrueder).
lexi(brueder).
lexi(schwestern).
lexi(cousins).
lexi(cousinen).
