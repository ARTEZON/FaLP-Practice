:- include('Numeric Tasks, Part I [Task 2].pl').

% Вариант 5. Задачи 5, 20, 28


% Дан целочисленный массив и натуральный индекс (число, меньшее размера массива). Необходимо определить является ли элемент по указанному индексу глобальным минимумом.

% min_list_element(+List, -MinElement) - записывает в MinElement минимальный элемент списка
min_list_element([H], H) :- !.
min_list_element([H|T], MinElement) :- min_list_element(T, NextMin), min(H, NextMin, MinElement).

% get_by_index(+List, +Index, -Element) - записывает в Element элемент списка с заданным индексом
get_by_index([H|_], 1, H) :- !.
get_by_index([_|T], Index, Element) :- NextIndex is Index - 1, get_by_index(T, NextIndex, Element).

% is_min_element(+List, +Index) - определяет, является ли элемент списка по указанному индексу минимальным
is_min_element([H|T], Index) :- get_by_index([H|T], Index, Element), min_list_element([H|T], Min), Element is Min.

% program__is_min_element/0 - точка входа для определения, является ли элемент списка по указанному индексу минимальным
program__is_min_element :-
    writeln("The program will determine whether the list element at the specified index is a global minimum."),
    write("Please enter your list length here: "), read(Length),
    write("Enter "), write(Length), writeln(" numbers separated by dots and spaces:"), read_list(Length, List),
    write("Enter index of your chosen element: "), read(Index),
    (is_min_element(List, Index) -> write("Yes, the element is a global minimum."); write("No, the element is not a global minimum.")).


% Дан целочисленный массив. Необходимо найти все пропущенные числа.

% in_list(+List, +Element) - проверяет, находится ли элемент в списке
in_list([Element|_], Element) :- !.
in_list([_|T], Element) :- in_list(T, Element).

% max_list_element(+List, -MaxElement) - записывает в MaxElement максимальный элемент списка
max_list_element([H], H) :- !.
max_list_element([H|T], MaxElement) :- max_list_element(T, NextMax), max(H, NextMax, MaxElement).

% find_missing_numbers(+List, -Result) - записывает в Result пропущенные целые числа
find_missing_numbers(List, Result) :- min_list_element(List, Min), max_list_element(List, Max), find_missing_numbers(List, Min, Max, [], Result).
% find_missing_numbers(+List, +MinNumber, +MaxNumber, +TempList, -Result) - вспомогательный предикат
find_missing_numbers(_, MaxNumber, MaxNumber, TempList, TempList) :- !.
find_missing_numbers(List, CurNumber, MaxNumber, TempList, Result) :-
    (not(in_list(List, CurNumber)) -> append(TempList, [CurNumber], NewTempList); NewTempList = TempList), 
    NextNumber is CurNumber + 1, find_missing_numbers(List, NextNumber, MaxNumber, NewTempList, Result).

% program__find_missing_numbers/0 - точка входа для нахождения пропущенных чисел
program__find_missing_numbers :-
    writeln("The program will find numbers missing from a list."),
    write("Please enter your list length here: "), read(Length),
    write("Enter "), write(Length), writeln(" numbers separated by dots and spaces:"), read_list(Length, List),
    find_missing_numbers(List, Result), write("The missing numbers are "), write_list(Result).


% Дан целочисленный массив. Необходимо найти элементы, расположенные между первым и последним максимальным.

% slice_after_first(+List, +Element, -ResultList) - записывает в ResultList часть списка List после первого Element
slice_after_first([], _, ResultList) :- ResultList = [], !.
slice_after_first([H|T], Element, ResultList) :- H is Element -> ResultList = T; slice_after_first(T, Element, ResultList).

% slice_before_last(+List, +Element, -ResultList) - записывает в ResultList часть списка List перед последним Element
slice_before_last([H|T], Element, ResultList) :- reverse([H|T], Reversed), slice_after_first(Reversed, Element, Res), reverse(Res, ResultList).

% between_first_and_last_max(+List, -ResultList) - записывает в ResultList список из элементов, расположенных между первым и последним максимальным
between_first_and_last_max(List, ResultList) :- max_list_element(List, Max), slice_after_first(List, Max, Temp), slice_before_last(Temp, Max, ResultList).

% program__between_first_and_last_max/0 - точка входа для нахождения элементов, расположенных между первым и последним максимальным
program__between_first_and_last_max :-
    writeln("The program will find list elements located between the first and last maximum."),
    write("Please enter your list length here: "), read(Length),
    write("Enter "), write(Length), writeln(" numbers separated by dots and spaces:"), !, read_list(Length, List), !,
    between_first_and_last_max(List, Result), !, write("Result: "), write_list(Result).
