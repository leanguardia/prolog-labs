prefix(Xs, Ys) :- append(Ys, _, Xs).
suffix(Xs, Ys) :- append(_, Ys, Xs).
sublist(Xs, Ys) :- suffix(Xs, Zs), prefix(Zs, Ys).

?- prefix([1,2,3,45], X).