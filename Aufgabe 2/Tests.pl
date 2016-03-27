% Autor:
% Datum: 27.03.2016

%Fragestellungen

:-consult(dcg).

:-begin_tests(fragestellung).
test(frage1) :- X = [ist,donaldduck,onkel,von,tickduck],
                frage(X,[]).
                
test(frage2) :- X = [wer,ist,onkel,von,tickduck],
                frage(X,[]).
:-end_tests(fragestellung).