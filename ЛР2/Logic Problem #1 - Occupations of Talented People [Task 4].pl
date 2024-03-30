% Вариант 5.

% Воронов, Павлов, Левицкий и Сахаров – четыре талантливых молодых человека.
% Один из них танцор, другой художник, третий - певец, а четвертый - писатель.
% О них известно следующее: Воронов и Левицкий сидели в зале консерватории в тот вечер, когда певец дебютировал в сольном концерте.
% Павлов и писатель вместе позировали художнику.
% Писатель написал биографическую повесть о Сахарове и собирается написать о Воронове.
% Воронов никогда не слышал о Левицком. 
% Кто чем занимается?

% task/0 - решить задачу
task :- People = [_, _, _, _],
    member([voronov, Occup1], People),
    member([pavlov, Occup2], People),
    member([levitsky, Occup3], People),
    member([sakharov, Occup4], People),

    member([_, dancer], People),
    member([_, artist], People),
    member([_, singer], People),
    member([_, writer], People),

    % Воронов и Левицкий сидели в зале консерватории - они не певцы
    Occup1 \= singer,
    Occup3 \= singer,
    % Павлов позировал вместе с писателем - он не писатель
    Occup2 \= writer,
    % Павлов позировал художнику - он не художник
    Occup2 \= artist,
    % Писатель пишет биографическую повесть о Сахарове и Воронове - они не писатели
    Occup4 \= writer,
    Occup1 \= writer,

    write('Voronov is '), write(Occup1), nl,
    write('Pavlov is '), write(Occup2), nl,
    write('Levitsky is '), write(Occup3), nl,
    write('Sakharov is '), write(Occup4), nl.
