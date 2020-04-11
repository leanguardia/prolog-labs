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

find_travels(_LeftBank, RightBank, _T) :- length(RightBank,4).
find_travels(LeftBank, RightBank, T) :- % Add Negative case in each travel
	action(LeftBank, RightBank, Direction),
	( Direction = way    -> delete(LeftBank,man,[LH|LT]),
        					is_safe(LT),
        					find_travels(LT,[man,LH|RightBank],T+1)
    ; Direction = return -> delete(RightBank,man,[RH|RT]),
        					is_safe(RT),
        					find_travels([man,RH|LeftBank],RT,T+1)
	).


/** <examples>
?- is_safe([rye,fox]).
?- find_travels([man,fox],[],0).
?- action([man,fox,hen,rye],[],Travels).
?- findall(E, element(E), List).
*/