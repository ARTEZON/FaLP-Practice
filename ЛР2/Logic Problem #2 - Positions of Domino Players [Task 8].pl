% Вариант 5.

% Четыре человека играют в домино. Их фамилии Кузнецов, Токарев, Слесарев и Резчиков.
% Профессия каждого игрока соответствует фамилии одного из других игроков.
% Напротив Кузнецова сидит слесарь. Напротив Резчикова сидит резчик.
% Справа от Слесарева сидит токарь. Кто сидит слева от кузнеца?

% Люди
person(Person) :- member(Person, [kuznetsov, tokarev, slesarev, rezchikov]).

% Профессии
occupation(Occupation) :- member(Occupation, [kuznets, tokar, slesar, rezchik]).

% get_all_combinations(-Positions) - генерирует все возможные сочетания
get_all_combinations(Positions) :-
    person(Person1), person(Person2), person(Person3), person(Person4),
    is_set([Person1, Person2, Person3, Person4]),
    occupation(Occup1), occupation(Occup2), occupation(Occup3), occupation(Occup4),
    is_set([Occup1, Occup2, Occup3, Occup4]),
    Positions = [person(Person1, Occup1), person(Person2, Occup2), person(Person3, Occup3), person(Person4, Occup4)].

% Оставляет все возможные варианты сидеть напротив друг друга
opposite(Positions, A, B) :-
    Positions = [A, _, B, _];
    Positions = [_, A, _, B];
    Positions = [B, _, A, _];
    Positions = [_, B, _, A].

% Оставляет все возможные варианты сидеть слева и справа
left_right(Positions, L, R) :-
    Positions = [L, R, _, _];
    Positions = [_, L, R, _];
    Positions = [_, _, L, R];
    Positions = [R, _, _, L].

% check_conditions(+Positions) - проверяет все условия задачи и оставляет только те комбинации, которые им соответствуют
check_conditions(Positions) :-
    % Профессия игрока не может соответствовать его фамилии
    \+ member(person(kuznetsov, kuznets), Positions),
    \+ member(person(tokarev, tokar), Positions),
    \+ member(person(slesarev, slesar), Positions),
    \+ member(person(rezchikov, rezchik), Positions),
    % Напротив Кузнецова сидит слесарь
    opposite(Positions, person(kuznetsov, _), person(_, slesar)),
    \+ member(person(kuznetsov, slesar), Positions),
    % Напротив Резчикова сидит резчик
    opposite(Positions, person(rezchikov, _), person(_, rezchik)),
    \+ member(person(rezchikov, rezchik), Positions),
    % Справа от Слесарева сидит токарь
    left_right(Positions, person(slesarev, _), person(_, tokar)),
    \+ member(person(slesarev, tokar), Positions).

% solve/0 - решить задачу
solve :-
    get_all_combinations(Positions),
    check_conditions(Positions),
    % writeln('All positions that meet the conditions:'),
    nth0(1, Positions, person(_, kuznets)),
    writeln(Positions), nl,
    nth0(0, Positions, LeftOfKuznets),
    write('The person who sits to the left of the kuznets is: '), writeln(LeftOfKuznets), nl,
    fail; true.
