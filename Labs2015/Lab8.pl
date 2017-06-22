% LAB 8
%next_to
next_to(a,b).
next_to(a,c).
next_to(a,f).
next_to(b,c).
next_to(b,d).
next_to(b,e).
next_to(c,d).
next_to(d,e).
next_to(d,f).

%link
link(a,b,3).
link(a,c,4).
link(a,f,1).
link(b,c,5).
link(b,d,3).
link(b,e,2).
link(c,d,2).
link(d,e,1).
link(d,f,5).

%next
next(X,Y) :-
	next_to(X,Y).
next(X,Y) :-
	next_to(Y,X).
	
%existpath
existpath(Start, End) :-
	next_to(Start, End).
existpath(Start, End) :-
	next_to(Start, Second),
	existpath(Second, End).
	
%path
path(Start, End, [Start, End]) :-
	next_to(Start, End).
path(Start, End, [Start|PathRest]) :-
	next_to(Start, Second),
	path(Second, End, PathRest).
	
%pathlength
pathlength(Start, End, [Start, End], 1) :-
	next_to(Start, End).
pathlength(Start, End, [Start|PathRest], Length) :-
	next_to(Start, Second),
	pathlength(Second, End, PathRest, LengthRest),
	Length is LengthRest + 1.
	
%pathcost
pathcost(Start, End, [Start, End], Cost) :-
	link(Start, End, Cost).
pathcost(Start, End, [Start|PathRest], Cost) :-
	link(Start, Second, Cost12),
	pathcost(Second, End, PathRest, CostRest),
	Cost is CostRest + Cost12.
	
%pathloop
pathloop(Start, End, _, [Start, End]) :-
	next_to(Start, End).
pathloop(Start, End, Visited, [Start|PathRest]) :-
	next_to(Start, Second),
	not(member(Second, Visited)),
	pathloop(Second, End, [Second|Visited], PathRest).

