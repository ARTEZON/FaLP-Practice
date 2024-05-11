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


% Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа

% coprime(+N1, +N2) - проверяет, являются ли числа N1 и N2 взаимно простыми
coprime(N1, N2) :- gcd_down(N1, N2, GCD), GCD is 1.

% digits_prod(+N, -Product) - вычисляет произведение цифр числа N
digits_prod(0, 1) :- !.
digits_prod(N, Product) :- NextN is N // 10, Digit is N mod 10, digits_prod(NextN, NextProd), Product is NextProd * Digit.

% sum_divs(+N, -Res) - записывает в Res сумму делителей числа N, взаимно простых с суммой цифр числа N и не взаимно простых с их произведением
sum_divs(N, Res) :- sum_divs(N, 1, 0, Res).
% sum_divs(+N, +CurDiv, +CurSum, -Res) - производит вычисления для предиката sum_divs(+N, -Res)
sum_divs(N, CurDiv, CurSum, Res) :- CurDiv > N, Res is CurSum, !.
sum_divs(N, CurDiv, CurSum, Res) :- digits_sum_up(N, DigSum), digits_prod(N, DigProd),
    ((is_divisor(N, CurDiv), coprime(CurDiv, DigSum), \+ coprime(CurDiv, DigProd)) -> X = CurDiv; X = 0),
    NewDiv = CurDiv + 1, NewSum = CurSum + X, sum_divs(N, NewDiv, NewSum, Res).

% program__sum_divs/0 - точка входа для нахождения суммы делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с их произведением
program__sum_divs :-
    write("Enter any natural number: "), read(N),
    sum_divs(N, Result), write("The sum of the divisors of your number that are coprime to the sum of its digits and not coprime to the product of its digits is "), write(Result), write(".").
