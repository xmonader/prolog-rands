%% STRANGE SQUARES.
%%% 45 -> 2025 is strange because 4+5 = 2+0+2+5.

solve(X, Y):-
    between(10, 99, X),
    Y is X*X,
    Y >= 1000,
    Y // 100 + Y mod 100 =:= X.
