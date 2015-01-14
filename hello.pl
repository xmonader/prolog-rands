friend(john, julia).
friend(john, jack).
friend(julia, sam).
friend(julia, molly).

loves(john, julia).
loves(julia, sam).
loves(sam, julia).



male(brad).
male(john).
male(jim).
male(alfred).
female(marry).
child(brad, alfred).
child(john, jim).
child(john, marry).

parent(X, Y) :- child(Y,X).
father(X, Y) :- child(Y,X), male(X).
mother(X, Y) :- child(Y,X), female(X).
friend(X, Y) :- friend(Y,X).
friendzoned(X) :- loves(X, Y), \+ loves(Y,X).
