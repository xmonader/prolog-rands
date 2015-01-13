%deeply based on thinking as computation example

%domain
num(1). num(2).
num(3). num(4).


showspace :- write(' ').
%row representation.
showrow(A, B, C, D) :-
    showspace, write(A), showspace, write(B), showspace, write(C), showspace, write(D), nl. 

%create unique values of A,B,C,D based.
uniq(A,B,C,D) :-
    num(A), num(B), num(C), num(D), \+ A=B, \+ A=C, \+ A=D, \+ B=C, \+ B=D, \+ C=D.

%find solution to sudoku 4x4 based on constraints.
solution(C11, C12, C13, C14,
         C21, C22, C23, C24,
         C31, C32, C33, C34,
         C41, C42, C43, C44) :-
    %rows (every row is uniq).
    uniq(C11, C12, C13, C14), uniq(C21, C22, C23, C24), uniq(C31, C32, C33, C34), uniq(C41, C42, C43, C44),
    %columns (every column is uniq).
    uniq(C11, C21, C31, C41), uniq(C12, C22, C32, C42), uniq(C13, C23, C33, C43), uniq(C14, C24, C34, C44),
    %blocks  (every block (2x2) cells is uniq).
    uniq(C11, C12, C21, C22), uniq(C31, C32, C41, C42), uniq(C13, C14, C23, C24), uniq(C33, C34, C43, C44).


solve(C11, C12, C13, C14,
      C21, C22, C23, C24,
      C31, C32, C33, C34,
      C41, C42, C43, C44) :-

        solution(C11, C12, C13, C14,
                 C21, C22, C23, C24,
                 C31, C32, C33, C34,
                 C41, C42, C43, C44), 
        showrow(C11, C12, C13, C14), showrow(C21, C22, C23, C24), showrow(C31, C32, C33, C34), showrow(C41, C42, C43, C44),nl.


