/* 
 * Lab 2 * Exercise 3
 */

memberh(_,[]):-false.
memberh(E,[E|_]).
memberh(E,[H|T]):- E=H ; memberh(E,T).

appendh(L,[],N):- L=N.
appendh(L,[M|T],N):-append([L|M],T,N).

sumlisth([],0).
sumlisth([N],N).
sumlisth([h|t],S):-sumlisth(t,h+S). % is this OK.?

suffixh(L,L).
suffixh([_|T],L):-suffixh(T,L). 

preffixh(_,[]).
preffixh([],_):-false.
preffixh([L|Ls],[M|Ms]):- L=M, preffixh(Ls,Ms).

/*
 * Lab 2 - Eliza
*/

eliza(Stimuli, Response) :-
    template(InternalStimuli, InternalResponse),
    match(InternalStimuli, Stimuli),
    match(InternalResponse, Response),
    !.

template([s([i,am]),s(X)], [s([why,are,you]),s(X),w('?')]).
template([w(i),s(X),w(you)], [s([why,do,you]),s(X),w(me),w('?')]).

% recognize close relative.
template([s([i,saw,my]),s(X)], [s([how,is,your]),s(X),w(going),w('?')]).
template(_, [please,go,on]).

match([],[]).
match([Item|Items],[Word|Words]) :-
    match(Item, Items, Word, Words).

match(w(Word), Items, Word, Words) :-
    match(Items, Words).
match(s([Word|Seg]), Items, Word, Words0) :-
    append(Seg, Words1, Words0),
    match(Items, Words1).


/** <examples>

?- eliza([i, am, very, hungry], Response).
?- eliza([i, love, you], Response).

*/
