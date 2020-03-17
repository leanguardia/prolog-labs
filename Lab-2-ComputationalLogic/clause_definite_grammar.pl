:- use_rendering(svgtree, [list(false)]).

sentence(s(T)) --> nounPhrase(T).
sentence(s(T1,T2)) --> nounPhrase(T1), verbPhrase(T2).

nounPhrase(np(T)) --> noun(T).
nounPhrase(np(T1,T2)) --> noun(T1), relativeClause(T2).

verbPhrase(vp(T)) --> verb(T).
verbPhrase(vp(T1,T2)) --> verb(T1), nounPhrase(T2).
relativeClause(rc(T1,T2)) --> nounPhrase(T1), verb(T2).

noun(n(police)) --> [police].
verb(v(police)) --> [police] .

/** <examples>
?- phrase(sentence(T), [police]).
?- phrase(sentence(T), [police,police]).
?- phrase(sentence(T), [police,police,police]).
?- phrase(sentence(T), X).
?- phrase(sentence(_), X).
?- phrase(sentence(s(T)),X).
?- between(1,5,N), length(L,N), phrase(sentence(T),L).
?- between(1,5,N), length(L,N), call((phrase(sentence(T),L),!)).
?- between(1,5,N), length(L,N), phrase(sentence(_),L), writeln(L), sleep(0.2), false. 
**/
