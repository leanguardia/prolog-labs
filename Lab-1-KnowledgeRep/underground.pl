connected(bond_street,oxford_circus,central).
connected(oxford_circus,tottenham_court_road,central).
connected(bond_street,green_park,jubilee).
connected(green_park,charing_cross,jubilee).
connected(green_park,piccadilly_circus,piccadilly).
connected(piccadilly_circus,leicester_square,piccadilly).
connected(green_park,oxford_circus,victoria).
connected(oxford_circus,piccadilly_circus,bakerloo).
connected(piccadilly_circus,charing_cross,bakerloo).
connected(tottenham_court_road,leicester_square,northern).
connected(leicester_square,charing_cross,northern).

reachable(X,Y,[]):-connected(X,Y,_).
reachable(X,Y,[Z|R]):-connected(X,Z,_),
                      reachable(Z,Y,R).

reachable_with_2(X,Y,[Z1,Z2|Zs]):-connected(X,Z1,_),
    							connected(Z1,Z2,_),
    							reachable(Z2,Y,Zs).

link(X,Y):-connected(X,Y,_);connected(Y,X,_).

% Having the member check after the recursieve call
% might result in very inefficient solutions
% or even infinite loops
% Even though the semantics is correct.
npath(X,Y,[]) :- link(X,Y).
npath(X,Y,[Z|R]) :- link(X,Z), Z\=Y, npath(Z,Y,R), \+ member(Z,R).

% Get filter before the recursive call
% This one generates all possible paths
path(X,[X|Xs],[X|Xs]).
path(X,[Y|Ys],Zs) :- X\=Y, link(Z,Y), \+ member(Z,[Y|Ys]), path(X,[Z,Y|Ys],Zs).
% Z is something that exists, it will check all possible links.

/** <examples>
?- reachable(bond_street, piccadilly_circus, [A,B|Cs]).
?- reachable(piccadilly_circus, bond_street, [A,B|Cs]).
?- link(bond_street,oxford_circus).
?- link(oxford_circus,bond_street).
?- npath(bond_street, leicester_square, Path).
?- path(bond_street, [piccadilly_circus], P).
?- path(bond_street, [piccadilly_circus], [A,B,C,D|P]).
?- trace, path(bond_street,[piccadilly_circus],Z).
*/

