factorial(1, 1).
factorial(N, Fact) :- N>0, N1 is N-1, factorial(N1, FactSub), Res is N*FactSub).
