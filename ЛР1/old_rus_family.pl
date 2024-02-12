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

% Вывод на экран всех мужчин и всех женщин
men :- man(X), write(X), nl, fail.
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

% children(+X) - все дети X
children(X) :- parent(X, Y), write(Y), nl, fail.

% mother(+X, +Y) - проверка является ли X матерью Y
mother(X, Y) :- parent(X, Y), woman(X).

% mother(+X) - мама X
mother(X) :- parent(Y, X), woman(Y), write(Y), nl, fail.

% brother(+X, +Y) - проверка является ли X братом Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), man(X).

% brothers(+X) - братья X
brothers(X) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), man(Y), write(Y), nl, fail.

% sister(+X, +Y) - проверка является ли X сестрой Y
sister(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), woman(X).

% sisters(+X) - сёстры X
sisters(X) :- parent(Z, X), parent(Z, Y), X \= Y, man(Z), woman(Y), write(Y), nl, fail.

% b_s(+X, +Y) - являются ли X и Y родными братом и сестрой или братьями или сестрами
b_s(X, Y) :- brother(X, Y).
b_s(X, Y) :- sister(X, Y).

% b_s(+X) - все братья или сестры X
b_s(X) :- brother(X, Y), write(Y), nl, fail.
b_s(X) :- sister(X, Y), write(Y), nl, fail.
