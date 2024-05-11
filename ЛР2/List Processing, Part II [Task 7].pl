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
