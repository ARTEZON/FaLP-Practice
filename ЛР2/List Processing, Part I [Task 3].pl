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
