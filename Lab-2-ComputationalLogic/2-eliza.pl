/*
 * Lab 2 - 4 / 4 
 * Eliza
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
