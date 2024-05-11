:- include('Basic Recursion [Task 1].pl').

% Вариант 5. Задачи 41, 45, 50, 59


% Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.

% mean_of_abs(+List, -Result) - записывает в Result среднее арифметическое модулей элементов списка List
mean_of_abs(List, Result) :- mean_of_abs(List, 0, 0, Result).
% mean_of_abs(+List, +CurCount, +CurSum, -Result) - производит вычисления для предиката mean_of_abs(+List, -Result)
mean_of_abs([], CurCnt, CurSum, Result) :- Result is CurSum / CurCnt, !.
mean_of_abs([H|T], CurCnt, CurSum, Result) :- Modulus is abs(H), NewCnt is CurCnt + 1, NewSum is CurSum + Modulus, mean_of_abs(T, NewCnt, NewSum, Result).

% program__mean_of_abs/0 - точка входа для нахождения среднего арифметического модулей элементов списка
program__mean_of_abs :-
    writeln("The program will find the average of your list elements absolute values."),
    write("Please enter your list length here: "), read(Length),
    write("Enter "), write(Length), writeln(" numbers separated by dots and spaces:"), read_list(Length, List),
    write("Result: "), mean_of_abs(List, Mean), write(Mean).


% Дан целочисленный массив и интервал a..b. Необходимо найти сумму элементов, значение которых попадает в этот интервал.

% sum_from_interval(+List, +A, +B, -Result) - записывает в Result сумму элементов списка List, которые находятся в интервале [A, B]
sum_from_interval([], _, _, 0) :- !.
sum_from_interval([H|T], A, B, Result) :- sum_from_interval(T, A, B, PrevResult), ((H >= A, H =< B) -> Result is PrevResult + H; Result is PrevResult).

% program__sum_from_interval/0 - точка входа для нахождения суммы элементов списка, значение которых попадает в заданный интервал
program__sum_from_interval :-
    writeln("The program will find the sum of your list elements whose values lie between A and B (inclusive)."),
    write("Please enter your list length here: "), read(Length),
    write("Enter "), write(Length), writeln(" numbers separated by dots and spaces:"), read_list(Length, List),
    write("Enter A (minimum value): "), read(A),
    write("Enter B (maximum value): "), read(B),
    write("Result: "), sum_from_interval(List, A, B, Sum), write(Sum).
