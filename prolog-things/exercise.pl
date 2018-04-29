% Exercise 1
printEven([]).

printEven([_]).

printEven([_, X]) :-
  write(X), nl.

printEven([_, X | T]) :-
  write(X), nl,
  printEven(T).

% Exercise 2
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

deconsonant([]).

deconsonant([H | T]) :-
  vowel(H),
  write(H), nl,
  deconsonant(T).

deconsonant([H | T]) :-
  not(vowel(H)),
  deconsonant(T).

% Exercise 3
head([X | _], X).

% Exercise 4
tail([_ | Xs], Xs).

% Exercise 5
last([X], X).

last([_ | Xs], X) :-
  last(Xs, X).

% Exercise 6
max(X, Y, Out) :-
  X > Y,
  Out is X.

max(X, Y, Out) :-
  Y > X,
  Out is Y.

% Exercise 7
fact(0, 1).
fact(1, 1).

fact(N, R) :-
  N > 1,
  N2 is N - 1,
  fact(N2, R2),
  R is R2 * N.

% Exercise 8
fib(0, 0).
fib(1, 1).
fib(X, R) :-
  X >= 2,
  X1 is X - 1,
  X2 is X - 2,
  fib(X1, R1),
  fib(X2, R2),
  R is R1 + R2.

% Exercise 9
length2([_], 1).

length2([_ | Xs], L) :-
  length2(Xs, L2),
  L is L2 + 1.

% Exercise 10
power(_, 0, 1).

power(X, Y, R) :-
  Y1 is Y - 1,
  power(X, Y1, R1),
  R is X * R1.

% Exercise 11
count_vowels([X], R) :-
  vowel(X),
  R is 1.

count_vowels([X], R) :-
  not(vowel(X)),
  R is 0.

count_vowels([X | Xs], R) :-
  vowel(X),
  count_vowels(Xs, R1),
  R is R1 + 1.

count_vowels([X | Xs], R) :-
  not(vowel(X)),
  count_vowels(Xs, R).

% Exercise 12
vowels([], []).

vowels([X|Xs], [X|Q]) :-
  vowel(X),
  vowels(Xs,Q).

vowels([X|Xs], Q) :-
  not(vowel(X)),
  vowels(Xs, Q).

% Exercise 13
nple(N, [X], [R]) :-
  R is X * N.

nple(N, [X|Xs], [R|Q]) :-
  R is X * N,
  nple(N, Xs, Q).

% Exercise 14
delAll(_, [], []).

delAll(E, [X|Xs], Q) :-
  X = E,
  delAll(E, Xs, Q).

delAll(E, [X|Xs], [X|Q]) :-
  not(X = E),
  delAll(E, Xs, Q).

% Exercise 15
findEverySecond([_, X], [X]).

findEverySecond([_, X | Xs], [X | R]) :-
  findEverySecond(Xs, R).

% Exercise 16
sum([], 0).

sum([X|Xs], R) :-
  sum(Xs, R1),
  R is X + R1.

% Exercise 17
nth(1, [X|_], X).

nth(I, [_|Xs], R) :-
  NextI is I - 1,
  nth(NextI, Xs, R).

% Exercise 18
dupli([X], [X, X]).

dupli([X | Xs], [X, X | Rs]) :-
  dupli(Xs, Rs).

% Exercise 19
split(Xs, 0, [], Xs).

split([X|Xs], L, [X|Q], R) :-
  NextL is L - 1,
  split(Xs, NextL, Q, R).

% Extra
penultimo([P, _], P).

penultimo([_ | T], P) :-
  penultimo(T, P).

miembro([E | _], E).
miembro([_ | Xs], E) :-
  miembro(Xs, E).
