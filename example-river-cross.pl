eats(fox,hen).
eats(hen,rye).

safe([_]).
safe([A,B]) :- \+ eats(A,B).
safe([_,_,_]).

action(LeftBank, _, Direction) :- 
    ( memberchk(man, LeftBank) -> Direction = way
    ; otherwise ->  Direction = return
    ).

% cross(From,To,With):-safe(From).

% find_travels(LeftBank,RightBank,T) :- length(RightBank,4)
% find_travels(LeftBank,RightBank,T) :-
%  direction(LeftBank,RightBank)
%	( memberchk(man,LeftBank) -> safe(LeftBank), cross(LeftBank,RightBank,)
%	 ; otherwise -> is_safe(RightBank), 
%    ),
%   find_travels(LeftBank,RightBank,T).
% 