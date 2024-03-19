:- include('1. Simple recursion predicates.pl').

% Вариант 5

% Найти максимальную цифру числа.

% max(+A, +B, -Max) - записывает в Max максимальное число из A и B
max(A, B, A) :- A > B, !.
max(_, B, B).

% max_digit_up(+Number, -MaxDigit) - находит максимальную цифру числа с помощью рекурсии вверх
max_digit_up(0, 0) :- !.
max_digit_up(Number, MaxDigit) :- Number < 0 -> AbsNumber is abs(Number), max_digit_up(AbsNumber, MaxDigit), !.
max_digit_up(Number, MaxDigit) :- CurrentDigit is Number mod 10, NextNumber is Number // 10,
    max_digit_up(NextNumber, NextMaxDigit), max(NextMaxDigit, CurrentDigit, MaxDigit).

% max_digit_down(+Number, -MaxDigit) - находит максимальную цифру числа с помощью рекурсии вниз
max_digit_down(Number, MaxDigit) :- AbsNumber is abs(Number), max_digit_down(AbsNumber, 0, MaxDigit).
% max_digit_down(+Number, +CurrentMax, -MaxDigit) - вспомогателный предикат
max_digit_down(0, CurrentMax, CurrentMax).
max_digit_down(Number, CurrentMax, MaxDigit) :- CurrentDigit is Number mod 10, NextNumber is Number // 10,
    NewMax is max(CurrentMax, CurrentDigit), max_digit_down(NextNumber, NewMax, MaxDigit).

% Найти минимальную нечётную цифру числа.

% min(+A, +B, -Min) - записывает в Min минимальное число из A и B
min(A, B, A) :- A < B, !.
min(_, B, B).

% is_odd(+Number) - определяет, является ли число нечётным
is_odd(Number) :- Number mod 2 =:= 1.

% min_odd_digit_up(+Number, -MinOddDigit) - находит минимальную нечётную цифру числа с помощью рекурсии вверх
min_odd_digit_up(0, -1) :- !.
min_odd_digit_up(Number, MinOddDigit) :- Number < 0 -> AbsNumber is abs(Number), min_odd_digit_up(AbsNumber, MinOddDigit), !.
min_odd_digit_up(Number, MinOddDigit) :- CurrentDigit is Number mod 10, NextNumber is Number // 10,
    min_odd_digit_up(NextNumber, NextMinOddDigit), (is_odd(CurrentDigit) -> (NextMinOddDigit =\= -1 ->
    min(NextMinOddDigit, CurrentDigit, MinOddDigit); MinOddDigit is CurrentDigit); MinOddDigit is NextMinOddDigit).

% min_odd_digit_down(+Number, -MinOddDigit) - находит минимальную нечётную цифру числа с помощью рекурсии вниз
min_odd_digit_down(Number, MinOddDigit) :- AbsNumber is abs(Number), min_odd_digit_down(AbsNumber, -1, MinOddDigit).
% min_odd_digit_down(+Number, +CurrentOddMin, -MinOddDigit) - вспомогателный предикат
min_odd_digit_down(0, CurrentOddMin, CurrentOddMin).
min_odd_digit_down(Number, CurrentOddMin, MinOddDigit) :- CurrentDigit is Number mod 10, NextNumber is Number // 10,
    (is_odd(CurrentDigit) -> (CurrentOddMin =\= -1 -> min(CurrentOddMin, CurrentDigit, NewMin);
    NewMin is CurrentDigit); NewMin is CurrentOddMin), min_odd_digit_down(NextNumber, NewMin, MinOddDigit).

% Найти НОД двух чисел.

% gcd_up(+A, +B, -GCD) - нахождение НОД двух чисел A и B рекурсией вверх
gcd_up(A, B, GCD) :- (A > B -> gcd_up(A, B, B, GCD); gcd_up(B, A, A, GCD)).
% gcd_up(+A, +B, +CurrentGCD, -GCD) - предикат, выполняющий рекурсию
gcd_up(_, _, 1, 1) :- !.
gcd_up(A, B, CurrentPossibleGCD, GCD) :- NextPossibleGCD is CurrentPossibleGCD - 1, gcd_up(A, B, NextPossibleGCD, SmallerCommonDivisor),
    (is_divisor(A, CurrentPossibleGCD), is_divisor(B, CurrentPossibleGCD), GCD is CurrentPossibleGCD, !; GCD is SmallerCommonDivisor).

% gcd_down(+A, +B, -GCD) - нахождение НОД двух чисел A и B рекурсией вниз (алгоритм Евклида)
gcd_down(A, 0, A) :- !.
gcd_down(A, B, GCD) :- B > A -> gcd_down(B, A, GCD).
gcd_down(A, B, GCD) :- Remainder is A mod B, gcd_down(B, Remainder, GCD).
