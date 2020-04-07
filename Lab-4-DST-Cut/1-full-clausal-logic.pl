% Book 2.3

%mouse(X, tail_of_mouse(Y)).
%loves(universal_lover(X), Y).
macs(X,Y,X):-X>=Y,!.
macs(_,Y,Y).
% maximum(number(X), number(Y), macs(X,Y,Z)).
