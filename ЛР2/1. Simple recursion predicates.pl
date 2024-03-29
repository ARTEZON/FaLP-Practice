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

% is_divisor(+Number, +Divisor) - проверяет, является ли Divisor делителем Number
is_divisor(Number, Divisor) :- Remainder is Number mod Divisor, Remainder is 0.

% is_square(+PossibleSquare) - проверяет, является ли число PossibleSquare квадратом какого-либо натурального числа
is_square(PossibleSquare) :- MaxDivisor is PossibleSquare // 2, is_square(PossibleSquare, MaxDivisor).
% is_square(+PossibleSquare, +Number) - проверяет, является ли число PossibleSquare квадратом числа Number
is_square(_, 1) :- !, fail.
is_square(PossibleSquare, Number) :- PossibleSquare is Number * Number; NewNumber is Number - 1, is_square(PossibleSquare, NewNumber).

% is_square_free(+Number) - проверяет, является ли число Number свободным от квадратов
is_square_free(1).
is_square_free(Number) :- is_square_free(Number, Number).
% is_square_free(+Number, +Divisor) - вспомогательный предикат для данной проверки
is_square_free(_, 1).
is_square_free(Number, Divisor) :- not((is_divisor(Number, Divisor), is_square(Divisor))), NewDivisor is Divisor - 1, is_square_free(Number, NewDivisor).

% read_list(+Length, -List) - ввести список с клавиатуры
read_list(0, []).
read_list(Length, [Head|Tail]) :- read(Head), NewLength is Length - 1, read_list(NewLength, Tail).

% write_list(+List) - вывести список на экран
write_list([]).
write_list([Head|Tail]) :- write(Head), write(" "), write_list(Tail).

% sum_list_down(+List, ?Sum) - проверяет, является ли Sum суммой элементов списка или записывает в эту переменную сумму элементов с помощью рекурсии вниз
sum_list_down(List, Sum) :- sum_list_down(List, 0, Sum).
% sum_list_down(+List, +CurSum, ?Sum) - вспомогательный предикат для рекурсии sum_list_down
sum_list_down([], CurSum, CurSum) :- !.
sum_list_down([Head|Tail], CurSum, Sum) :- NewSum is CurSum + Head, sum_list_down(Tail, NewSum, Sum).

% program_calc_sum_list/0 - программа, читающая список, считающая сумму элементов и выводящая её на экран
program_calc_sum_list :- write("Please enter your list length here: "), read(Length),
                         write("Enter "), write(Length), write(" numbers separated by dots: "), nl,
                         read_list(Length, List), sum_list_down(List, Sum),
                         write("The sum of your numbers is "), write(Sum), write(".").

% sum_list_up(+List, ?Sum) - проверяет, является ли Sum суммой элементов списка или записывает в эту переменную сумму элементов с помощью рекурсии вверх
sum_list_up([], 0) :- !.
sum_list_up([Head|Tail], Sum) :- sum_list_up(Tail, SumOfTail), Sum is SumOfTail + Head.

% remove_items_by_digit_sum(+DigitSum, +ListIn, -ListOut) - удаляет из списка элементы, сумма цифр которых равна данной
remove_items_by_digit_sum(_, [], []) :- !.
remove_items_by_digit_sum(DigitSum, [HeadIn|TailIn], ListOut) :- digits_sum_down(HeadIn, HeadInSum), HeadInSum == DigitSum, remove_items_by_digit_sum(DigitSum, TailIn, ListOut).
remove_items_by_digit_sum(DigitSum, [HeadIn|TailIn], [HeadIn|TailOut]) :- digits_sum_down(HeadIn, HeadInSum), HeadInSum =\= DigitSum, remove_items_by_digit_sum(DigitSum, TailIn, TailOut).

% remove_items_by_digit_sum_and_print(+DigitSum, +List) - удаляет из списка элементы, сумма цифр которых равна данной, и выводит результат на экран
remove_items_by_digit_sum_and_print(DigitSum, List) :- remove_items_by_digit_sum(DigitSum, List, Result), write_list(Result).
