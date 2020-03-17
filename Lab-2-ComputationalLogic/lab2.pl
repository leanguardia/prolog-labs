/* 
 * Lab 2 * Exercise 3
 */

memberh(_,[]):-false.
memberh(E,[E|_]).
memberh(E,[H|T]):- E=H ; memberh(E,T).

appendh(L,[],N):- L=N.
appendh(L,[M|T],N):-append([L|M],T,N).

% First implementation
sumlisth([],0).
sumlisth([N],N).
sumlisth([h|t],S):-sumlisth(t,h+S). % is this OK.?
        % UPDATE: maybe I answer this question after understanding search logic underneath.

% Second review after reading instruction in Lab instruction
%sumlisth2([],0).
%sumlisth2([n],n).
%sumlisth2([H|T],S):- , Sum is H+Ssumlisth2([T],Sum).

suffixh(L,L).
suffixh([_|T],L):-suffixh(T,L). 

preffixh(_,[]).
% preffixh([],_):-false. % NOTE IS IS NOT NECCESSARY TO DEFINE WHAT IS FALSE.
preffixh([L|Ls],[M|Ms]):- L=M, preffixh(Ls,Ms).

sublisth(L,M):-preffixh(L,M).
sublisth([_L|Ls],M):-sublisth(Ls,M).

/** <examples>
?- sumlisth2([],Sum).
?- suffixh([1,2,3],[]).
?- suffixh([1,2,3],[2,3]).
?- sublisth([1,2,3,4],[2,3]).
?- sublisth([1,2,3,4],[4]).
?- eliza([i, am, very, hungry], Response).
?- eliza([i, love, you], Response).
*/
