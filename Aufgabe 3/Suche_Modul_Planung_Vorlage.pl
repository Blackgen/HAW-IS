% Die Schnittstelle umfasst
%   start_description   ;Beschreibung des Startzustands
%   start_node          ;Test, ob es sich um einen Startknoten handelt
%   goal_node           ;Test, ob es sich um einen Zielknoten handelt
%   state_member        ;Test, ob eine Zustandsbeschreibung in einer Liste 
%                        von Zustandsbeschreibungen enthalten ist
%   expand              ;Berechnung der Kind-Zustandsbeschreibungen
%   eval-path           ;Bewertung eines Pfades


start_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4),
  block(block5),
  on(table,block1),
  on(table,block3),
  on(table,block4),
  on(block1,block2),
  on(block4,block5),
  clear(block2),
  clear(block3),
  clear(block5),
  handempty
  ]).
  
goal_description([
  block(block1),
  block(block2),
  block(block3),
  block(block4),
  block(block5),
  on(table,block4),
  on(table,block5),
  on(block4,block2),
  on(block2,block1),
  on(block5,block3),
  clear(block1),
  clear(block3),
  handempty
  ]).

start_description1([
  block(block1),
  block(block2),
  block(block3),
%  block(block4),  %mit Block4
  on(table, block2),
  on(table, block3),
  on(block2, block1),
%  on(table, block4), %mit Block4
  clear(block1),
  clear(block3),
%  clear(block4), %mit Block4
  handempty
  ]).

goal_description1([
  block(block1),
  block(block2),
  block(block3),
%  block(block4), %mit Block4
%  on(block4, block2), %mit Block4
  on(table, block3),
  on(table, block1),
%  on(block1, block4), %mit Block4
  on(block1,block2), %ohne Block4
  clear(block3),
  clear(block2),
  handempty
  ]).
  

start_node((start,_,_)).

goal_node((_,State,_)):-
  goal_description(Goal),
  state_member(State, [Goal]).
  % "Zielbedingungen einlesen"
  % "Zustand gegen Zielbedingungen testen".

% Aufgrund der Komplexit�t der Zustandsbeschreibungen kann state_member nicht auf 
% das Standardpr�dikat member zur�ckgef�hrt werden.
%  
state_member(_,[]):- !,fail.

state_member(State, [FirstState|_]):-
  mysubset(State, FirstState).
  % "Test, ob State bereits durch FirstState beschrieben war. Tipp: Eine
  % L�sungsm�glichkeit besteht in der Verwendung einer Mengenoperation, z.B. subtract"  ,!.

%Es ist sichergestellt, dass die beiden ersten Klauseln nicht zutreffen.
state_member(State,[_|RestStates]):-  
  state_member(State, RestStates).
  % "rekursiver Aufruf".


eval_path(Strategy, Path):-
  length(Path, G),
  eval_state(Strategy, Path, G).
  % "Rest des Literals bzw. der Klausel"
  % "Value berechnen".

% A Algorithm
eval_state(a, [(_,State, Value)|_], G) :-
          h(wrong_position, State, H), Value is H + G.
          
% Gierige Bestensuche + hill climbing with backtracking
% gb_and_hcwbt = gierige bestensuche und hillclimbing with backtracking
% Hierbei gibt es wie in den Folien beschrieben keine Ber�cksichtigung der
% Bisherigen Kosten G (Parameter 3 von eval_state)
eval_state(gb_and_hcwbt, [(_,State, H)|_], _) :-
          h(wrong_position, State, H).
          
% Durch subtract werden die States nach jenen gefiltert, welche an der falschen
% Position sind.
h(wrong_position, State, H) :- goal_description(Goal),
                               subtract(Goal, State, Rest),
                               length(Rest, H).

action(pick_up(X),
       [handempty, clear(X), on(table,X)],
       [handempty, clear(X), on(table,X)],
       [holding(X)]).

action(pick_up(X),
       [handempty, clear(X), on(Y, X), block(Y)],
       [handempty, clear(X), on(Y, X)],
       [holding(X), clear(Y)]).

action(put_on_table(X),
       [holding(X)],
       [holding(X)],
       [handempty, clear(X), on(table,X)]).

action(put_on(Y, X),
       [holding(X), clear(Y)],
       [holding(X), clear(Y)],
       [handempty, clear(X), on(Y, X)]).


% Hilfskonstrukt, weil das PROLOG "subset" nicht die Unifikation von Listenelementen 
% durchf�hrt, wenn Variablen enthalten sind. "member" unifiziert hingegen.
%
mysubset([],_).
mysubset([H|T], List):-
  member(H, List),
  mysubset(T, List).


%
% subset() = teilmenge -> Zwei Listen Parameter
% intersection() = Schnittmenge -> drei Parameter -> Liste, Liste , Ergebniseliste
% union()  = Vereinigung -> drei Parameter -> Liste, Liste, ErgebnisListe
expand_help(State, Name, NewState):-
  action(Name, ConditionItems, DeleteItems, AddItems),
  mysubset(ConditionItems, State),
  subtract(State, DeleteItems, DeletedItems),
  union(DeletedItems, AddItems, NewState).
  % "Action suchen"
  % "Conditions testen (Teilmengenrelation)?"
  % "Del-List umsetzen (Schnittmenge)?"
  % "Add-List umsetzen (Vereinigungsmenge)?".
  
expand((_,State,_), Result):-
  findall((Name, NewState,_), expand_help(State, Name, NewState), Result).







