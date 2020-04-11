eats(fox,hen).
eats(hen,rye).

% This is a way to represent states.
% Binding man, fox ... with either 0 or 1.
state([man:M, fox:F, hen:H, rye:R]) :-
    member(M,[0,1]),
    member(F,[0,1]),
    member(H,[0,1]),
    member(R,[0,1]).

% TODO
% move(X,Y)
% moves(X,Y,W):-!
% moves(X,Y,W):-

/** <examples>
?- state([man:0,fox:0,hen:0,rye:0]).
*/