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
