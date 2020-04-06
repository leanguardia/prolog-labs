prefix(Xs, Ys) :- append(Ys, _, Xs).
suffix(Xs, Ys) :- append(_, Ys, Xs).
sublist(Xs, Ys) :- suffix(Xs, Zs), prefix(Zs, Ys).

% Try to code these operators in another programming style
% Prolog is "flexible and clean".
% Predicates allow arguments to be variables.
% 

/** <examples>
?- suffix([1,2,3,4],[3,4]).
?- suffix([1,2,3,4],X).
?- suffix(X,[3,4]).
?- append(Xs, Ys, Zs).
**/
