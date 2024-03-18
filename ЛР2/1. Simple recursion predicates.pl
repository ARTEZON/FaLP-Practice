% max(+X, +Y, +Z, -U) - записывает в U максимальное число из X, Y, Z
max(X, Y, Z, X) :- X > Y, X > Z, !.
max(_, Y, Z, Y) :- Y > Z, !.
max(_, _, Z, Z).
