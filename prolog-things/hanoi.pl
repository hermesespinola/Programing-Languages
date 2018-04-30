hanoi(N) :-
  move(N, left, middle, right).

move(0,_,_,_).

move(N,A,B,C) :-
    M is N-1,
    move(M,A,C,B),
    display(A,B),
    move(M,C,B,A).

display(X,Y) :-
  write("move the top disk from "),
  write(X),
  write(" pole to "),
  write(Y),
  write(" pole."),
  nl.
