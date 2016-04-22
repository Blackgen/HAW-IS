% Autor:
% Datum: 24.03.2016

% ------------------------------------------------------------------------------

% Interogativpronomen
lexi(wer, iterogativpronomen).
lexi(wie, iterogativpronomen).
lexi(was, iterogativpronomen).

% Verben
lexi(ist, ist, verb, mannlich).
lexi(ist, ist, verb, weiblich).
lexi(ist, sind, verb, plural).
%lexi(hat, hat, verb, singular).

% Praepositionen
lexi(von, praeposition).

% Artikel
lexi(der, artikel, mannlich).
lexi(die, artikel, weiblich).
lexi(die, artikel, plural).

% Nomen Singular
lexi(onkel, onkel, nomen, mannlich).
lexi(tante, tante, nomen, weiblich).
lexi(opa, opa, nomen, mannlich).
lexi(oma, oma, nomen, weiblich).
lexi(vater, vater, nomen, mannlich).
lexi(mutter, mutter, nomen, weiblich).
lexi(schwester, schwester, nomen, weiblich).
lexi(bruder, bruder, nomen, mannlich).
lexi(halbschwester, halbschwester, nomen, weiblich).
lexi(halbbruder, halbbruder, nomen, mannlich).
lexi(uroma, uroma, nomen, weiblich).
lexi(uropa, uroma, nomen, mannlich).
lexi(cousin, cousin, nomen, mannlich).
lexi(cousine, cousine, nomen, weiblich).
lexi(nichte, nichte, nomen, weiblich).
lexi(neffe, neffe, nomen, mannlich).

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

lexi(des,vers).
lexi(vom,vers).