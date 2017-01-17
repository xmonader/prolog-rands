%% Solve ABCDE * 4 = EDCBA 
%% WHERE A, B, C, D, E are unique ints from 0 to 9

%% number to string. 
n2s(N,S):- atom_number(S, N).

%% join list of digits as a string. 
concatenate(NumsList, OutString):- maplist(n2s, NumsList, CharsList), atom_codes(OutString, CharsList).
%% CONSTRAINTS 
%% DEFINE WHAT IS A NUMBER.
num(0). num(1). num(2). num(3). num(4). num(5). num(6). num(7). num(8). num(9).

%% UNIQUENESS.
uniq(A,B,C,D,E) :- num(A), num(B), num(C), num(D), num(E), \+ A=B, \+ A=C, \+ A=D, \+ A=E, \+ B=C, \+ B=D, \+ B=E, \+ C=D, \+ C=E, \+ D=E.

%% LEFT HAND SIDE OF EQUATION ABCDE * 4
lhs(A,B,C,D,E, Res):- concatenate([A,B,C,D,E],Rescon), atom_number(Rescon, Res1), Res is Res1*4. 

%% RIGHT HAND SIDE OF EQUATION EDCBA
rhs(A,B,C,D,E, Res) :-
    concatenate([E,D,C,B,A], Rescon), atom_number(Rescon, Res1), Res is Res1.

%% SOLVE USING CONSTRAINTS (A,B,C,D,E uniq numbers) and LHS (ABCDE*4) = RHS (EDCBA).
solve(A,B,C,D,E):-
    uniq(A,B,C,D,E), lhs(A,B,C,D,E,Res1), rhs(A,B,C,D,E,Res2), Res1 = Res2, write(Res1), string_to_list(Res1, LRes1), reverse(LRes1, RevL), atom_chars(RevS, RevL), write(' '), write(RevS).
