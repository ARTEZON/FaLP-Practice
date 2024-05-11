:- include('Numeric Tasks, Part I [Task 2].pl').

% Вариант 5


% Найти количество делителей числа, не делящихся на 3

% count_divs(+N, -Res) - записывает в Res количество делителей числа N, не делящихся на 3
count_divs(N, Res) :- count_divs(N, 1, 0, Res).
% count_divs(+N, +CurDiv, +CurCount, -Res) - производит вычисления для предиката count_divs(+N, -Res)
count_divs(N, CurDiv, CurCount, Res) :- CurDiv > N, Res is CurCount, !.
count_divs(N, CurDiv, CurCount, Res) :- ((is_divisor(N, CurDiv), \+ is_divisor(CurDiv, 3)) -> X = 1; X = 0),
    NewDiv = CurDiv + 1, NewCount = CurCount + X, count_divs(N, NewDiv, NewCount, Res).

% program__count_divs/0 - точка входа для нахождения количества делителей числа, не делящихся на 3
program__count_divs :-
    write("Enter any natural number: "), read(N),
    count_divs(N, Result), write("Your number has "), write(Result), write(" divisor(s) that are not divisible by 3.").
