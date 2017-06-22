% LAB 5
sum([], 0).
sum([H|T], Sum) :-
	sum(T, SumT),
	Sum is SumT + H.

teleytaio([X], X).
teleytaio([H|T], Last) :-
	teleytaio(T, Last).

melos(X, [X|T]).
melos(X, [H|T]) :-
	melos(X, T).

element([H|T], 1, H).
element([H|T], N, X) :-
	N1 is N-1,
	element(T, N1, X).

% 1� ���� (����� ��������� ��� ������� ���������)
max([X], X).
max([H|T], H) :-
	max(T, MaxT),
	H > MaxT.
max([H|T], MaxT) :-
	max(T, MaxT),
	H =< MaxT.

/* 2� ���� (������ ���������)
max([X], X).
max([H|T], Max) :-
	max(T, MaxT),
	H > MaxT,
	Max = H.
max([H|T], Max) :-
	max(T, MaxT),
	H =< MaxT,
	Max = MaxT.
*/

% 1� ���� (����� ��������� - ��������� ������������ ��������� ��� X)
del(X, [X|T], T).
del(X, [H|T], [H|LT]) :-
	del(X, T, LT).

/* 2� ���� (������� ��������� - �������� ��� ������ ��������� ��� X)
del(X, [X|T], L) :-
	L = T.
del(X, [H|T], L) :-
	X \= H, 
	del(X, T, L�),
	L = [H|LT].
*/

% 1� ���� (����� ���������)
delall(X, [], []).
delall(X, [X|T], LT) :-
	delall(X, T, LT).
delall(X, [H|T], [H|LT]) :-
	X \= H,
	delall(X, T, LT).

/* 2� ���� (������� ���������)
delall(X, [], []).
delall(X, [H|T], L) :-
	X = H,
	delall(X, T, LT),
	L = LT.
delall(X, [H|T], L) :-
	X \= H,
	delall(X, T, LT),
	L = [H|LT].
*/