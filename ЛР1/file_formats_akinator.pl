text_file(txt, 1).
text_file(jpeg, 2).
text_file(png, 2).
text_file(gif, 2).
text_file(bmp, 2).
text_file(svg, 1).
text_file(psd, 2).
text_file(mp3, 2).
text_file(wav, 2).
text_file(flac, 2).
text_file(mp4, 2).
text_file(avi, 2).
text_file(zip, 2).
text_file(tar, 2).
text_file(pdf, 2).
text_file(docx, 2).
text_file(xlsx, 2).
text_file(csv, 1).
text_file(exe, 2).
text_file(apk, 2).
text_file(html, 1).
text_file(mov, 2).

content(txt, 1).
content(jpeg, 2).
content(png, 2).
content(gif, 2).
content(bmp, 2).
content(svg, 2).
content(psd, 2).
content(mp3, 4).
content(wav, 4).
content(flac, 4).
content(mp4, 3).
content(avi, 3).
content(zip, 7).
content(tar, 7).
content(pdf, 1).
content(docx, 1).
content(xlsx, 5).
content(csv, 5).
content(exe, 6).
content(apk, 6).
content(html, 1).
content(mov, 3).

compression(txt, 1).
compression(jpeg, 3).
compression(png, 2).
compression(gif, 2).
compression(bmp, 1).
compression(svg, 1).
compression(psd, 1).
compression(mp3, 3).
compression(wav, 1).
compression(flac, 2).
compression(mp4, 3).
compression(avi, 3).
compression(zip, 2).
compression(tar, 1).
compression(pdf, 2).
compression(docx, 2).
compression(xlsx, 2).
compression(csv, 1).
compression(exe, 1).
compression(apk, 2).
compression(html, 1).
compression(mov, 3).

feature(txt, 6).
feature(jpeg, 6).
feature(png, 6).
feature(gif, 1).
feature(bmp, 6).
feature(svg, 4).
feature(psd, 3).
feature(mp3, 2).
feature(wav, 6).
feature(flac, 6).
feature(mp4, 2).
feature(avi, 6).
feature(zip, 6).
feature(tar, 6).
feature(pdf, 6).
feature(docx, 6).
feature(xlsx, 6).
feature(csv, 6).
feature(exe, 6).
feature(apk, 5).
feature(html, 6).
feature(mov, 6).

office(txt, 2).
office(jpeg, 2).
office(png, 2).
office(gif, 2).
office(bmp, 2).
office(svg, 2).
office(psd, 2).
office(mp3, 2).
office(wav, 2).
office(flac, 2).
office(mp4, 2).
office(avi, 2).
office(zip, 2).
office(tar, 2).
office(pdf, 2).
office(docx, 1).
office(xlsx, 1).
office(csv, 2).
office(exe, 2).
office(apk, 2).
office(html, 2).
office(mov, 2).

web_pages(txt, 2).
web_pages(html, 1).

made_by_apple(avi, 2).
made_by_apple(mov, 1).


% question_text_file(-X_text_file)
question_text_file(X_text_file) :-
writeln("\nDoes this file format open correctly in a simple text editor like Notepad?"),
writeln("1. Yes"),
writeln("2. No"),
read(X_text_file).

% question_content(-X_content)
question_content(X_content) :-
writeln("\nWhat data does this file format contain?"),
writeln("1. Text, documents"),
writeln("2. Images"),
writeln("3. Videos"),
writeln("4. Music"),
writeln("5. Spreadsheets"),
writeln("6. Compiled programs"),
writeln("7. It contains other files within itself"),
read(X_content).

% question_compression(-X_compression)
question_compression(X_compression) :-
writeln("\nDoes this format support compression?"),
writeln("1. No"),
writeln("2. Yes, lossless compression"),
writeln("3. Yes, lossy compression"),
read(X_compression).

% question_feature(-X_feature)
question_feature(X_feature) :-
writeln("\nWhat feature does this file format have?"),
writeln("1. It's used for short looping animations"),
writeln("2. The file extension contains a number"),
writeln("3. Files can store individual image layers"),
writeln("4. This is a vector graphics format"),
writeln("5. This format is intended for Android OS"),
writeln("6. None of the above"),
read(X_feature).

% question_office(-X_office)
question_office(X_office) :-
writeln("\nIs this format designed for Microsoft Office?"),
writeln("1. Yes"),
writeln("2. No"),
read(X_office).

% question_web_pages(-X_web_pages)
question_web_pages(X_web_pages) :-
writeln("\nIs this format used for web pages?"),
writeln("1. Yes"),
writeln("2. No"),
read(X_web_pages).

% question_made_by_apple(-X_made_by_apple)
question_made_by_apple(X_made_by_apple) :-
writeln("\nIs this format developed by Apple?"),
writeln("1. Yes"),
writeln("2. No"),
read(X_made_by_apple).


% in_list(+List, +Element)
in_list([El|_], El).
in_list([_|T], El) :- in_list(T, El).


% start/0
start :- writeln("Think about a file format. I will try to guess it."),

    question_text_file(X_text_file),
    findall(Y, (text_file(Y, X_text_file)), MatchList1),
    check_if_guessed(MatchList1),

    question_content(X_content),
    findall(Y, (text_file(Y, X_text_file), content(Y, X_content)), MatchList2),
    check_if_guessed(MatchList2),

    question_compression(X_compression),
    findall(Y, (text_file(Y, X_text_file), content(Y, X_content), compression(Y, X_compression)), MatchList3),
    check_if_guessed(MatchList3),

    question_feature(X_feature),
    findall(Y, (text_file(Y, X_text_file), content(Y, X_content), compression(Y, X_compression), feature(Y, X_feature)), MatchList4),
    check_if_guessed(MatchList4),

    question_office(X_office),
    findall(Y, (text_file(Y, X_text_file), content(Y, X_content), compression(Y, X_compression), feature(Y, X_feature), office(Y, X_office)), MatchList5),
    check_if_guessed(MatchList5),

    (in_list(MatchList5, txt), in_list(MatchList5, html) ->
        question_web_pages(X_web_pages),
        findall(Y, (text_file(Y, X_text_file), content(Y, X_content), compression(Y, X_compression), feature(Y, X_feature), office(Y, X_office), web_pages(Y, X_web_pages)), MatchList6),
        check_if_guessed(MatchList6); true),

    (in_list(MatchList5, avi), in_list(MatchList5, mov) ->
        question_made_by_apple(X_made_by_apple),
        findall(Y, (text_file(Y, X_text_file), content(Y, X_content), compression(Y, X_compression), feature(Y, X_feature), office(Y, X_office), made_by_apple(Y, X_made_by_apple)), MatchList7),
        check_if_guessed(MatchList7); true),

    write("\nSorry, I couldn't guess your file format."), !, fail; true.

% check_if_guessed(+MatchList)
check_if_guessed(MatchList) :- length(MatchList, MatchCount), (MatchCount =:= 1 -> [Answer | _] = MatchList,
string_upper(Answer, Answer_upper), write("\nI guessed it! Your file format is "), write(Answer_upper), write("."), fail; true).
