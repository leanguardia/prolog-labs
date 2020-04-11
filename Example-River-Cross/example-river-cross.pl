element(fox).
element(hen).
element(rye).
element(none).

eats(fox,hen).
eats(hen,rye).

is_safe([]).
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

rotate([H|T],R):-append(T,[H],R).

find_travels(_LeftBank, RightBank, _T) :- length(RightBank,4).
find_travels(LeftBank, RightBank, T) :- % Add Negative case in each travel
	action(LeftBank, RightBank, Direction),
	( Direction = way    -> delete(LeftBank,man,[LH|LT]),
        (   is_safe(LT) 	-> append(T,[LH],TPlus),find_travels(LT,[man,LH|RightBank],TPlus)
        ;   otherwise		-> rotate(LeftBank,LR),find_travels(LR,RightBank,T)
        )
    ; Direction = return -> delete(RightBank,man,[RH|RT]),
        (   is_safe(RT)     -> append(T,[RH],TPlus),find_travels([man,RH|LeftBank],RT,TPlus)
        ;   otherwise		-> rotate(RightBank,RR),find_travels(LeftBank,RR,T)
        )
	).


/** <examples>
?- is_safe([rye,fox]).
?- trace, (find_travels([man,fox,hen,rye],[],T)).
?- find_travels([man,fox,hen,rye],[],T).
?- action([fox,hen,rye,man],[],Travels).
?- findall(E, element(E), List).
*/