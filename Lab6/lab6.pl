sum([],0).

sum([H|T],X) :-
	sum(T,X1),
	X is X1 + H. 

teleytaio([H], H).

teleytaio([H|T],X) :-
	teleytaio(T,X).
	
melos(H, [H|T]).

melos(X, [H|T]) :-
	melos(X,T).
	
element([H|T],1,H).

element([H|T],N,X) :-
	N1 is N - 1,
	element(T,N1,X).
	
max([H], H).

max([H|T], X) :-
	max(T,X),
	X > H.
	
max([H|T], H) :-
	max(T,X),
	X < H.

min([H], H).

min([H|T], X) :-
	min(T,X),
	X < H.
	
min([H|T], H) :-
	min(T,X),
	X > H.

	