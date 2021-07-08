/*  

Brandon Holmes, Section 2, 500751878
Nya Samahan, Section 2, 500634913
Rafael Natividad, Section 3, 500705909

*/

solve([Oakville,Pickering,Richmondhill,Scarborough,Toronto]):-
	Oakville = [O1,O2,O3,O4,O5],
	Pickering = [P1,P2,P3,P4,P5],
	Richmondhill = [R1,R2,R3,R4,R5],
	Scarborough = [S1,S2,S3,S4,S5],
	Toronto = [T1,T2,T3,T4,T5],
	
	Round1 = [O1,P1,R1,S1,T1],
	Round2 = [O2,P2,R2,S2,T2],
	Round3 = [O3,P3,R3,S3,T3],
	Round4 = [O4,P4,R4,S4,T4],
	Round5 = [O5,P5,R5,S5,T5],
	
	points(W),points(L),points(D),points(S),
	
	/* Constraint 1*/
	S1 = W,
	P1 = L,
	P2 = W,
	O2 = L,
	
	/* Constraint 2*/
	T3 = S,
	(T2 = W,T1 = L) ; (T1 = W, T2 = L),
	
	/* Constraint 3*/
	O4 = S,
	O1 = W,
	O3 = W,
	
	/* Constraint 4*/
	P4 = D,
	R4 = D,
	S4 = D,
	T4 = D,
	(O5 = D,R5 = D,S5 = D,T5 = D,P5 = S,S4=S);(O5 = D,P5 = D,R5 = D,T5 = D,S5 = S,P4=S),
	
	/* Constraint 5*/
	
	(R1 = W, R2 = L, R3 = S); (R1 = W, R3 = L, R2 = S); (R1 = L, R2 = W, R3 = S); (R1 = L,R3 = W, R2 = S); (R1 = S, R2 = W, R3 = L); (R1 = S, R2 = L, R3 = W ),
	
	/*
	fill(Oakville),
	fill(Pickering),
	fill(Richmondhill),
	fill(Scarborough),
	fill(Toronto),
	*/
	
	roundCheck(O1,P1,R1,S1,T1),
	roundCheck(O2,P2,R2,S2,T2),
	roundCheck(O3,P3,R3,S3,T3),
	roundCheck(O4,P4,R4,S4,T4),
	roundCheck(O5,P5,R5,S5,T5).
	
	/* UNABLE TO IMPLEMENT, this Should take Null values and fill them with the appropriate score to complete the rounds 
	
	fill([],N). 
	fill([H|L]):-
		fill([H|L],0),
		roundCheck([H|L]).
		
	fill([H|L],N):-
		not integer(H),
		fill(L,N).
		
	fill([H|L],N):-
		points(H),
		fill(L,N).
		*/
	
	roundCheck(RoundList):- 	 /*Calculates total score for a round to check if 4 teams played and 1 sat*/
		roundCheck(N,RoundList).
		
	roundCheck(N,[]):-
		N = 3.		
	roundCheck(N,[H|L]):-
		C is H,
		I is (C+N),
		roundCheck(I,L).
		
	points(-1). points(0). points(1). points(2).