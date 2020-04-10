% Book 3.7

% p. 68 Write program which sorts and removes 
%       duplicates from a list, using set of.

% Epix Fail
% sort_and_unique([],[]).
% sort_and_unique([H|T],Result):-
%     sort_and_unique(T,Result)
%     setof(_,_,[T|Result]).

% Solution: 
sort(List,SortedList):-
  setof(X,element(X,List),SortedList).
  
  element(X,[X|Ys]).
  
  element(X,[Y|Ys]):-
  element(X,Ys). 