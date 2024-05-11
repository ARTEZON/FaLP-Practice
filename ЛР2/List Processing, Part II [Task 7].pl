:- include('List Processing, Part I [Task 3].pl').

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


% Для двух введённых списков L1 и L2 построить новый список, состоящий из элементов, встречающихся только в одном из этих списков и не повторяющихся в них.

% count_in_list(+List, +Element, -Result) - записывает в Result количество повторений элемента Element в списке List
count_in_list([], _, 0) :- !.
count_in_list([H|T], Element, Result) :- count_in_list(T, Element, PrevRes), (H is Element -> Result is PrevRes + 1; Result is PrevRes).

% get_from_list(+List, +FullList, +OtherList, -Result) - записывает в Result список элементов из List = FullList, которых нет в OtherList и которые не повторяются
get_from_list([], _, _, []) :- !.
get_from_list([H|T], FullList, OtherList, Result) :- get_from_list(T, FullList, OtherList, PrevRes),
    ((\+ in_list(OtherList, H), count_in_list(FullList, H, Cnt), Cnt is 1) -> append([H], PrevRes, Result); Result = PrevRes).

% list_from_nonrepeating_elements(+L1, +L2, -Result) - записывает в Result список, состоящий из элементов, встречающихся только в одном списке (L1 или L2) и не повторяющихся в нём
list_from_nonrepeating_elements(L1, L2, Result) :- get_from_list(L1, L1, L2, Res1), get_from_list(L2, L2, L1, Res2), append(Res1, Res2, Result).

% program__list_from_nonrepeating_elements/0 - точка входа для построения нового списка, состоящего из элементов, встречающихся только в одном из списков и не повторяющихся в них
program__list_from_nonrepeating_elements :-
    writeln("The program will construct a new list consisting of elements that appear in only one of the entered lists and are not repeated there."),
    write("[List 1] Please enter the length of the first list here: "), read(Length1),
    write("[List 1] Enter "), write(Length1), writeln(" numbers separated by dots and spaces:"), read_list(Length1, L1),
    write("[List 2] Please enter the length of the second list here: "), read(Length2),
    write("[List 2] Enter "), write(Length2), writeln(" numbers separated by dots and spaces:"), read_list(Length2, L2),
    write("Result: "), list_from_nonrepeating_elements(L1, L2, Result), write(Result).
