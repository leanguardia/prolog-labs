node(a).
node(b).
node(c).
node(d).
node(e).
node(f).
node(g).

h(a,0).
h(b,10).
h(c,1).
h(d,2).
h(e,1).
h(f,1).
h(g,1).

arc(a,b).
arc(b,f).
arc(f,g).
arc(a,c).
arc(c,d).
arc(d,e).
arc(e,f).

search_df([Goal|_Rest],Goal):-
	goal(Goal).
search_df([Current|Rest],Goal):-
	children(Current,Children),
    print(" Children"),
    print(Children),
	append(Children,Rest,NewAgenda),
    print(" NewAgenda:"),
    print(NewAgenda),
	search_df(NewAgenda,Goal).

goal(g).
children(Node,Children):-
	findall(C,arc(Node,C),Children).


