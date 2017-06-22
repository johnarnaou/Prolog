% LAB 6
% 1� ���� (����� ��������� ��� �������� �����)
posneg([], [], []).
posneg([H|T], [H|TP], TN) :-
	H >= 0,
	posneg(T, TP, TN).
posneg([H|T], TP, [H|TN]) :-
	H < 0,
	posneg(T, TP, TN).

/* 2� ���� (������ ���������)
posneg([], [], []).
posneg([H|T], LP, LN) :-
	posneg(T, TP, TN),
	H >= 0,
	append([H], TP, LP),
	LN = TN.
posneg([H|T], LP, LN) :-
	posneg(T, TP, TN),
	H < 0,
	append([H], TN, LN),
	LP = TP.
*/
%
sumlist([], 0).
sumlist([H|T], SL) :-
	sumlist(T, SLT),
	length(H, LH),
	SL is SLT + LH.

% 1� ���� (�� ��� ����� �������� ���������� ������)
enwshs([], L, L).
enwshs([H|T], L1, [H|L2]) :-
	not(member(H, L1)),
	enwshs(T, L1, L2).
enwshs([H|T], L1, L2) :-
	member(H, L1),
	enwshs(T, L1, L2).

% 2� ���� (�� ��� ����� �������� ���������� ������� ������)
enwsh([], L, L).
enwsh([H|T], L1, L2) :-
	enwsh(T, L1, L2T),
	not(member(H, L2T)),
	append([H], L2T, L2).
enwsh([H|T], L1, L2) :-
	enwsh(T, L1, L2T),
	member(H, L2T),
	L2 = L2T.

% 1� ���� (����� ���������)
flat([], []).
flat([H|T], [H|LT]) :-
	atomic(H),
	flat(T, LT).
flat([H|T], L) :-
	flat(T, LT),
	not(atomic(H)),
	flat(H, LH),
	append(LH, LT, L).

/* 2� ���� (������ ���������)
flat([], []).
flat([[]|T], L) :-
	flat(T, L).
flat([H|T], L) :-
	flat(T, LT),
	atomic(H),
	L = [H|LT].
flat([H|T], L) :-
	flat(T, LT),
	not(atomic(H)),
	flat(H, LH),
	append(LH, LT, L).
*/

%
memberlist(X, [H|_])  :-
	member(X, H).
memberlist(X, [_|T])  :-
	memberlist(X, T).
