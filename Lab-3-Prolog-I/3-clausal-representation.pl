% [Book 2.5] Relation between Clausal Logic and Predicate Logic
% CNF Conjuctive Normal Form 
% In Prolog Existential Qualifiers (∃) are replace by functors.

% Ex.1 Everybody loves somebody
% ∀X ∃Y: loves(X,Y)
loves(X, person_loved_by(Y)).

% Ex.2 Somebody loves everybody
% ∃X ∀Y: loves(X,Y)
loves(somebody_who_loves_everybody, X).

% Exercise: "Anyone who loves all animals,
%            is in turn loved by someone".
% cf. https://en.wikipedia.org/wiki/Conjunctive_normal_form

% Remove Implications
% Push Negations Through
% Quantifiers to De' Morgans Law
% Place Skolonization.
% Drop Universal Quantifiers
% De' Morgns 
 
% ∀X:( ∀Y: (animal(Y) -→ loves(X,Y)) -→ ∃Z: loves(Z,X))

% My attempt: loves(Y, person_loved_by(X)):- loves(X, animal(Y)).
% Solution:
% animal(sk1(X));loves(sk2(X), X)
% loves(sk2(X), X) :-  loves(X, sk1(X)).
