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