% Мужчины
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

% Женщины
woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

% men/0 - вывод на экран всех мужчин
men :- man(X), write(X), nl, fail.

% women/0 - вывод на экран всех женщин
women :- woman(X), write(X), nl, fail.

% Связь родители-дети
parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

% children(+X) - вывести на экран всех детей X
children(X) :- parent(X, Y), write(Y), nl, fail.

% mother(?X, +Y) - проверить является ли X матерью Y или записать маму Y в X
mother(X, Y) :- parent(X, Y), woman(X).

% mother(+X) - вывести на экран маму X
mother(X) :- mother(Y, X), write(Y).

% father(?X, +Y) - проверить является ли X отцом Y или записать папу Y в X
father(X, Y) :- parent(X, Y), man(X).

% father(+X) - вывести на экран папу X
father(X) :- father(Y, X), write(Y).

% brother(?X, +Y) - проверить является ли X братом Y или записать брата Y в X
brother(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), man(X).

% brothers(+X) - вывести на экран братьев X
brothers(X) :- brother(Y, X), write(Y), nl, fail.

% sister(?X, +Y) - проверить является ли X сестрой Y или записать сестру Y в X
sister(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), woman(X).

% sisters(+X) - вывести на экран сестёр X
sisters(X) :- sister(Y, X), write(Y), nl, fail.

% b_s(?X, +Y) - проверить является ли X братом или сестрой Y или записать брата или сестру Y в X
b_s(X, Y) :- brother(X, Y).
b_s(X, Y) :- sister(X, Y).

% b_s(+X) - вывести всех братьев или сестёр X
b_s(X) :- b_s(Y, X), write(Y), nl, fail.



% Задание 2. Вариант 5 (17 % 12 = 5)

% son(?X, +Y) - проверить является ли X сыном Y или записать сына Y в X
son(X, Y) :- parent(Y, X), man(X).

% son(+X) - вывести на экран сыновей X
son(X) :- son(Y, X), write(Y), nl, fail.

% husband(?X, +Y) - проверить является ли X мужем Y или записать мужа Y в X
husband(X, Y) :- parent(X, Z), parent(Y, Z), man(X), woman(Y).

% husband(+X) - вывести на экран мужа X
husband(X) :- husband(Y, X), write(Y).



% Задание 3

% grand_pa(?X, +Y) - проверить является ли X дедушкой Y или записать дедушку Y в X (с использованем только базы фактов)
grand_pa(X, Y) :- parent(X, Z), parent(Z, Y), man(X).

% grand_pa_2(?X, +Y) - проверить является ли X дедушкой Y или записать дедушку Y в X (с использованем готовых предикатов)
grand_pa_2(X, Y) :- father(X, Z), parent(Z, Y).

% grand_pas(+X) - вывести всех дедушек X
grand_pas(X) :- grand_pa(Y, X), write(Y), nl, fail.

% grand_pa_and_da(+X, +Y) - проверить являются ли X и Y дедушкой и внучкой или внучкой и дедушкой (с использованем только базы фактов)
grand_pa_and_da(X, Y) :- parent(X, Z), parent(Z, Y), man(X), woman(Y).
grand_pa_and_da(X, Y) :- parent(Y, Z), parent(Z, X), man(Y), woman(X).

% grand_pa_and_da_2(+X, +Y) - проверить являются ли X и Y дедушкой и внучкой или внучкой и дедушкой (с использованем готовых предикатов)
grand_pa_and_da_2(X, Y) :- grand_pa(X, Y), woman(Y).
grand_pa_and_da_2(X, Y) :- grand_pa(Y, X), woman(X).

% aunt(?X, +Y) - проверить является ли X тётей Y или записать тётю Y в X (с использованем только базы фактов)
aunt(X, Y) :- parent(W, X), parent(W, Z), X \= Z, woman(X), parent(Z, Y).

% aunt_2(?X, +Y) - проверить является ли X тётей Y или записать тётю Y в X (с использованем готовых предикатов)
aunt_2(X, Y) :- sister(X, Z), parent(Z, Y).

% aunts(+X) - вывести всех тётей X
aunts(X) :- aunt(Y, X), write(Y), nl, fail.
