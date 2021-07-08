/*  

Brandon Holmes, Section 2, 500751878
Nya Samahan, Section 2, 500634913
Rafael Natividad, Section 3, 500705909

*/

print_solution(List) :-
	solve([G,E,T,B,Y,A,R]),
	write(' '),write(' '),write(' '),write(G),write(E),write(T), nl,
	write('* '),write(' '),write(' '),write(B),write(Y), nl,
	write(' '),write('______'), nl,
	write(' '),write(' '),write(B),write(A),write(B),write(E), nl,
	write('+ '),write(G),write(E),write(T), nl,
	write(' '),write('______'), nl,
	write(' '),write(B),write(E),write(A),write(R),write(E), nl.

/* 

Pure Generate & Test 

*/

solve([G,E,T,B,Y,A,R]) :-
dig(G), dig(E), dig(T), dig(B), dig(Y), dig(A), dig(R), 

B > 0, G > 0,

E is (Y*T) mod 10, C1 is (Y*T) // 10,
B is ((Y*E) + C1) mod 10, C2 is ((Y*E) + C1) // 10,
A is ((Y*G) + C2) mod 10, B is ((Y*G) + C2) // 10,

T is (B*T) mod 10, C3 is (B*T) // 10,
E is ((B*E) + C3) mod 10, C4 is ((B*E) + C3) // 10,
G is ((B*G) + C4),

R is (B + T) mod 10, C5 is (B + T) // 10,
A is (A + E + C5) mod 10, C6 is (A + E + C5) // 10,
E is (B + G + C6) mod 10, C7 is (B + G + C6) // 10,
B is C7,
all_diff([G,E,T,B,Y,A,R]).

dig(0). dig(1). dig(2). dig(3). dig(4).
dig(5). dig(6). dig(7). dig(8). dig(9).

all_diff([]).
all_diff([N|L]) :- not member2(N,L), all_diff(L).

member2(N,[N|L]).
member2(N,[M|L]) :- member2(N,L).