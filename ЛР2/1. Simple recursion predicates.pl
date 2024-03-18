% max(+X, +Y, +Z, -U) - записывает в U максимальное число из X, Y, Z
max(X, Y, Z, X) :- X > Y, X > Z, !.
max(_, Y, Z, Y) :- Y > Z, !.
max(_, _, Z, Z).

% fact_up(+N, -X) - вычисляет факториал числа N посредством рекурсии вверх и записывает ответ в X
fact_up(0, 1) :- !.
fact_up(N, X) :- N_prev is N - 1, fact_up(N_prev, X_prev), X is N * X_prev.

% fact_down(+N, -X) - вычисляет факториал числа N посредством рекурсии вниз и записывает ответ в X
fact_down(N, X) :- fact_down(0, 1, N, X).
% fact_down(+N_current, +X_current, +N, -X) - вспомогательный предикат для факториала с рекурсией вниз
fact_down(N, X, N, X) :- !.
fact_down(N_current, X_current, N, X) :- N_next is N_current + 1, X_next is X_current * N_next, fact_down(N_next, X_next, N, X).

% digits_sum_up(+N, -Sum) - вычисляет сумму цифр числа N, используя рекурсию вверх
digits_sum_up(0, 0) :- !.
digits_sum_up(N, Sum) :- N1 is N // 10, Remainder is N mod 10, digits_sum_up(N1, Sum1), Sum is Sum1 + Remainder.

% digits_sum_down(+N, -Sum) - вычисляет сумму цифр числа N, используя рекурсию вниз
digits_sum_down(N, Sum) :- digits_sum_down(N, 0, Sum).
% digits_sum_down(+N, +CurrentSum, -Sum) - вспомогательный предикат для суммы цифр с рекурсией вниз
digits_sum_down(0, Sum, Sum) :- !.
digits_sum_down(N, CurrentSum, Sum) :- N1 is N // 10, Remainder is N mod 10, NewSum is CurrentSum + Remainder, digits_sum_down(N1, NewSum, Sum).
