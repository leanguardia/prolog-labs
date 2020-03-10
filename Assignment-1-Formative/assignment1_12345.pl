candidate_number(1977203).

q1(ailp_start_position(P)).

q2a(new_pos(p(1,1), e, P)).
q2b(136).

q3([s,e,w,n]).

q4a([p(1,4),p(1,3),p(1,2),p(2,2),p(2,1),p(3,1),p(4,1),p(4,2),p(3,2),p(3,3),p(4,3),p(4,4),p(3,4),p(2,4),p(2,3)]).
q4b([p(1,4),p(1,3),p(1,2),p(1,1),p(2,1),p(3,1),p(4,1),p(4,2),p(3,2),p(3,3),p(4,3),p(4,4),p(3,4),p(2,4),p(2,3)]).
q4c([p(2,3),p(2,4),p(1,4),p(1,3),p(1,2),p(2,2),p(3,2),p(3,3),p(3,4),p(4,4),p(4,3),p(4,2),p(4,1),p(3,1),p(2,1),p(1,1)]).
q4d([p(2,3),p(2,4),p(1,4),p(1,3),p(1,2),p(1,1),p(2,1),p(2,2),p(3,2),p(3,3),p(3,4),p(4,4),p(4,3),p(4,2),p(4,1),p(3,1)]).

q5_corner_move :-
  ailp_start_position(P),
  ailp_show_move(P, p(1,1)),
  ailp_show_move(p(1,1), p(4,1)),
  ailp_show_move(p(4,1), p(4,4)),
  ailp_show_move(p(4,4), p(1,4)).

q5_corner_move2 :-
  ailp_start_position(P),
  ailp_grid_size(N),
  ailp_show_move(P, p(1,1)),
  ailp_show_move(p(1,1), p(N,1)),
  ailp_show_move(p(N,1), p(N,N)),
  ailp_show_move(p(N,N), p(1,N)).
