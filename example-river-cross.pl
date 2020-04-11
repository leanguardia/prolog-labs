element(fox).
element(hen).
element(rye).
element(none).

eats(fox,hen).
eats(hen,rye).

is_safe([_]).
is_safe([A,B]) :- \+ eats(A,B), \+eats(B,A) .
is_safe([_,_,_]).

action(LeftBank, _, Direction) :- 
    ( memberchk(man, LeftBank) -> Direction = way
    ; otherwise 			   -> Direction = return ).

% next_element([],none).
% next_element([Elem],Elem).
% next_element([E1|Tail],):-next_element([E2|Tail],E2).
% cross([LeftH|LeftT]):-safe(With).
% return()

%find_travels(LeftBank, RightBank, T) :- length(RightBank,3).
%find_travels([LH|LT], [RH|RT], T) :- 
%	action(LeftBank, RightBank, Direction),
%	( Direction = way    -> is_safe(LT), cross(LeftBank,RightBank,)
%    ; Direction = return -> is_safe(RightBank), 
	% ),
	% find_travels(LeftBank,RightBank,T).

/** <examples>
?- is_safe([rye,fox]).
?- find_travelers([man,fox]).
?- action([man,fox,hen,rye],[],Travels).
?- findall(E, element(E), List).
*/