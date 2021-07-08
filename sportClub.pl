
/*  

Brandon Holmes, Section 2, 500751878
Nya Samahan, Section 2, 500634913
Rafael Natividad, Section 3, 500705909

*/
solve([President,VicePresident,Treasurer,Secretary]):- 
	
	candidate(President), candidate(VicePresident), candidate(Secretary), candidate(Treasurer),
	distinct_candidates(President,VicePresident,Secretary,Treasurer), /* Makes sure all candidates are unique as only one candidate can be elected to a position.*/
	
	not VicePresident = arthur, /* Constraint 1, Arthur does not want to work as vice-president*/
	not VicePresident = bart,	/* Constraint 2, Bart does not want to work as vice-president*/
	not Secretary = bart,	/* Constraint 2, Bart does not want to work as secretary*/
	not VicePresident = frank,	/* Constraint 6, Frank will only work as President*/
	not Secretary = frank,	/* Constraint 6, Frank will only work as President*/
	not Treasurer = frank,	/* Constraint 6, Frank will only work as President*/
	
	/* These Constraints were chosen to go first as they are simple comparisons and will quickly repick candidates if they fail*/
	
	compatible(President,VicePresident,Treasurer,Secretary), /* Constraints 4 and 5, Checks list of incompatible candidates */
	not frankCheck(President,VicePresident,Treasurer,Secretary), /* Constraint 6, Checks if Frank is president and Colleen isn't vice-president */
	colleenCheck(President,VicePresident,Treasurer,Secretary), /* Constraint 3, Checks if Colleen and Bart are elected so is Frank */
	arthurCheck(President,VicePresident,Treasurer,Secretary). /* Constraint 1, Arthur does not want to work without Bart*/
	
compatible(A,B,C,D):-
	not incompatible(A,B,C),
	not incompatible(A,B,D),
	not incompatible(A,C,D),
	not incompatible(B,C,D),
	
	not incompatible(A,B),
	not incompatible(A,C),
	not incompatible(A,D),
	not incompatible(B,C),
	not incompatible(B,D),
	not incompatible(C,D).
	
frankCheck(frank,colleen,_,_). /* Frank can only be President without Colleen as vice-president */

colleenCheck(A,B,C,D):- /* Constraint 3, Checks if Colleen is present then Bart, if both are predicate requires Frank to be present */
	not A = colleen,
	not B = colleen,
	not C = colleen,
	not D = colleen.
colleenCheck(A,B,C,D):-
	not A = bart,
	not B = bart,
	not C = bart,
	not D = bart.
colleenCheck(A,B,C,D):-
	A = frank; B = frank; C = frank; D = frank.


arthurCheck(A,B,C,D):- /* Constraint 1, If arthur is President check for Bart */
	not A = arthur,
	not B = arthur,
	not C = arthur,
	not D = arthur.
arthurCheck(A,B,C,D):-
	A = bart; B = bart; C = bart; D =bart.

	
distinct_candidates(P1,P2,P3,P4):- /* Makes sure all candidates are unique as only one candidate can be elected to a position.*/
candidate(P1),candidate(P2),candidate(P3),candidate(P4), not P1=P2, not P1=P3, not P1=P4, not P2=P3,not P2=P4,not P3=P4.

/* Constraint 4,5 List of incompatible candidates */
incompatible(donna,eva).
incompatible(eva,donna).

incompatible(donna,frank).
incompatible(frank,donna).

incompatible(eva,bart,arthur).
incompatible(eva,arthur,bart).
incompatible(arthur,bart,eva).
incompatible(arthur,eva,bart).
incompatible(bart,arthur,eva).
incompatible(bart,eva,arthur).

print_solution([President,VicePresident,Treasurer,Secretary]):-
	solve([President,VicePresident,Treasurer,Secretary]),
	write("The President is: "), write(President), nl,
	write("The Vice-President is: "), write(VicePresident), nl,
	write("The Treasurer is: "), write(Treasurer), nl,
	write("The Secretary is: "), write(Secretary), nl.
	

candidate(arthur). candidate(bart). candidate(colleen). candidate(donna). candidate(eva). candidate(frank).

/* 
?- solve(List).
List = [frank, eva, bart, colleen]
Yes (0.00s cpu, solution 1, maybe more)
List = [frank, eva, bart, colleen]
Yes (0.00s cpu, solution 2, maybe more)
No (0.00s cpu)


?- print_solution(List).
List = [frank, eva, bart, colleen]
Yes (0.00s cpu, solution 1, maybe more)
List = [frank, eva, bart, colleen]
Yes (0.00s cpu, solution 2, maybe more)
No (0.00s cpu)


-output: 
The President is: frank
The Vice-President is: eva
The Treasurer is: bart
The Secretary is: colleen
*/