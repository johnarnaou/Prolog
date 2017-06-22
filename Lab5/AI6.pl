posneg([], [], []).

posneg([H|T], LP, LN) :-
	posneg(T,LP,LN)
	H>0,
	append(LP,[H],LP).
	
posneg([H|T],LP,LN) :-
	H<0,
	append(LN,[H],LN).