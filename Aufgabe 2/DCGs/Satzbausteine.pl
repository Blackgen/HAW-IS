% Autor:
% Datum: 24.03.2016

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
lexi(wer, iterogativpronomen).
lexi(wie, iterogativpronomen).
lexi(was, iterogativpronomen).

% Verben
lexi(ist, ist, verb, singular).
lexi(ist, sind, verb, plural).
lexi(hat, hat, verb, singular).

% Praepositionen
lexi(von, praeposition).

% Artikel
lexi(der, artikel).
lexi(die, artikel).
lexi(die, artikel).

% Nomen Singular
lexi(onkel, onkel, nomen, singular).
lexi(tante, tante, nomen, singular).
lexi(opa, opa, nomen, singular).
lexi(oma, oma, nomen, singular).
lexi(vater, vater, nomen, singular).
lexi(mutter, mutter, nomen, singular).
lexi(schwester, schwester, nomen, singular).
lexi(bruder, bruder, nomen, singular).
lexi(halbschwester, halbschwester, nomen, singular).
lexi(halbbruder, halbbruder, nomen, singular).
lexi(uroma, uroma, nomen, singular).
lexi(uropa, uroma, nomen, singular).
lexi(cousin, cousin, nomen, singular).
lexi(cousine, cousine, nomen, singular).
lexi(nichte, nichte, nomen, singular).
lexi(neffe, neffe, nomen, singular).

% Nomen Plural
% Vaeter und Muetter vielleicht nur wenn man von mehreren verschiedenen Kindern
% jeweils Vater und Mutter haben moechte.
%lexi(X,MAtch,Art,Singula/Plural)
lexi(onkel, oenkel, nomen, plural).
lexi(tante, tanten, nomen, plural).
lexi(opa, opis, nomen, plural).
lexi(oma, omis, nomen, plural).
lexi(vater, vaeter, nomen, plural).
lexi(mutter, muetter, nomen, plural).
lexi(uropa, uropis, nomen, plural).
lexi(uroma, uromis, nomen, plural).
lexi(neffe, neffen, nomen, plural).
lexi(nichte, nichten, nomen, plural).
lexi(halbschwester, halbschwestern, nomen, plural).
lexi(halbbruder, halbbrueder, nomen, plural).
lexi(bruder, brueder, nomen, plural).
lexi(schwester, schwestern, nomen, plural).
lexi(cousin, cousins, nomen, plural).
lexi(cousine, cousinen, nomen, plural).

%
