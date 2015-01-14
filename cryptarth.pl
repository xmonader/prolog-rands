%   SEND
%   MORE +
%---------
%  MONEY

%find distinct values for characters to add up to MONEY.

dig(0). dig(1). dig(2). dig(3). dig(4).
dig(5). dig(6). dig(7). dig(8). dig(9).

uniq_d(S,E,N,D,M,O,R,Y) :-
    dig(S), dig(E), dig(N), dig(D), dig(M), dig(O), dig(R), dig(Y),
    \+ S=E, \+ S=N, \+ S=D, \+ S=M, \+ S=O, \+ S=R, \+ S=Y,
            \+ E=N, \+ E=D, \+ E=M, \+ E=O, \+ E=R, \+ E=Y,
                    \+ N=D, \+ N=M, \+ N=O, \+ N=R, \+ N=Y,
                            \+ D=M, \+ D=O, \+ D=R, \+ D=Y,
                                    \+ M=O, \+ M=R, \+ M=Y,
                                            \+ O=R, \+ O=Y,
                                                    \+ R=Y.

solve(S, E, N, D, M, O, R, Y) :-
    %assert they are uniq digits.
    uniq_d(S, E, N, D, M, O, R, Y), S>0, M>0,
    Y is (D+E) mod 10, C1 is (D+E)// 10, % Y = D+E (integer part), C1 holds the carry to add to N+R
    E is (N+R+C1) mod 10, C2 is (N+R+C1) // 10,
    N is (E+O+C2) mod 10, C3 is (E+O+C2) // 10,
    O is (S+M+C3) mod 10, C4 is (S+M+C3) // 10,
    M is C4.


