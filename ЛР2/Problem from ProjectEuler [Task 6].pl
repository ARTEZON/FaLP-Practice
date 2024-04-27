% Вариант 5

% pow(+N, +P, -Result) - возводит число N в степень P и помещает результат в Result
pow(N, 1, N) :- !.
pow(N, P, Res) :- P1 is P - 1, pow(N, P1, Temp), Res is N * Temp.

% sum_of_digits_in_power(+N, +P, -Sum) - возводит каждую цифру числа N в степень P, суммирует результаты и помещает сумму в Sum
sum_of_digits_in_power(0, _, 0) :- !.
sum_of_digits_in_power(N, P, Sum) :- CurDigit is N mod 10, NextN is N // 10, pow(CurDigit, 5, DigitInPow), sum_of_digits_in_power(NextN, P, NextSum), Sum is NextSum + DigitInPow.

% count_of_digits(+N, -Cnt) - считает количество цифр числа N и помещает его в Cnt
count_of_digits(0, 0) :- !.
count_of_digits(N, Cnt) :- NewN is N // 10, count_of_digits(NewN, NewCnt), Cnt is NewCnt + 1.

% check_number(+N) - проверяет, является ли число N суммой своих цифр, возведённых в 5 степень
check_number(N) :- sum_of_digits_in_power(N, 5, N).

% solve(+CurN, +CurSum, -Result) - выводит на экран все числа, являющиеся суммой своих цифр, возведённых в 5 степень, и возвращает сумму этих чисел
% Здесь первая строка - проверка условия останова (достижения такого числа, числа больше которого точно не могут быть решением задачи),
% а вторая строка - непосредственно перебор и вывод чисел и подсчёт суммы.
solve(CurN, CurSum, Result) :- pow(9, 5, NinePowFive), count_of_digits(CurN, DigCnt), MaxPossible is NinePowFive * DigCnt, MaxPossible < CurN, Result is CurSum.
solve(CurN, CurSum, Result) :- NextN is CurN + 1, (check_number(CurN) -> NewSum is CurSum + CurN, writeln(CurN); NewSum is CurSum), solve(NextN, NewSum, Result).

% solve/0 - запустить решение задачи и получить ответ
solve :- solve(10, 0, Result), write('Sum (answer) = '), write(Result).
