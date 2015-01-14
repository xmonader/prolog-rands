% 3 coins H H T.
% make them all HHH or TTT with in 3 moves.
% a move is changing H to T or changing T to H.

init_state([h,h,t]).

goal_state([h,h,h]).
goal_state([t,t,t]).


flip(h,t). %flip head -> tail.
flip(t,h). %flip tail -> head.

legal_move([X,Y,Z], flip_left, [X1, Y,Z]) :- flip(X,X1).
legal_move([X,Y,Z], flip_middle, [X, Y1,Z]) :- flip(Y,Y1).
legal_move([X,Y,Z], flip_right, [X, Y,Z1]) :- flip(Z,Z1).

plan(L):- init_state(I), goal_state(G), reachable(I,L,G).

%stay in S if we got no moves.
reachable(S,[],S).

%if we can reach S2 from S1 by M, and we can reach S3 from S2 by L
reachable(S1,[M|L], S3) :- legal_move(S1,M,S2), reachable(S2,L,S3).


