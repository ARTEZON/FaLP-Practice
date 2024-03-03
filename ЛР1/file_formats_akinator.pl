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


% question_text_file(-X_text_file)
question_text_file(X_text_file) :-
write("\nDoes this file format open correctly in a simple text editor like Notepad?"), nl,
write("1. Yes"), nl,
write("2. No"), nl,
read(X_text_file).

% question_content(-X_content)
question_content(X_content) :-
write("\nWhat data does this file format contain?"), nl,
write("1. Text, documents"), nl,
write("2. Images"), nl,
write("3. Videos"), nl,
write("4. Music"), nl,
write("5. Spreadsheets"), nl,
write("6. Compiled programs"), nl,
write("7. It contains other files within itself"), nl,
read(X_content).

% question_compression(-X_compression)
question_compression(X_compression) :-
write("\nDoes this format support compression?"), nl,
write("1. No"), nl,
write("2. Yes, lossless compression"), nl,
write("3. Yes, lossy compression"), nl,
read(X_compression).

% question_feature(-X_feature)
question_feature(X_feature) :-
write("\nWhat feature does this file format have?"), nl,
write("1. It's used for short looping animations"), nl,
write("2. The file extension contains a number"), nl,
write("3. Files can store individual image layers"), nl,
write("4. This is a vector graphics format"), nl,
write("5. This format is intended for Android OS"), nl,
write("6. None of the above"), nl,
read(X_feature).

% question_office(-X_office)
question_office(X_office) :-
write("\nIs this format designed for Microsoft Office?"), nl,
write("1. Yes"), nl,
write("2. No"), nl,
read(X_office).


% start/0
start :- write("Think about a file format. I will try to guess it."), nl,
question_text_file(X_text_file), question_content(X_content), question_compression(X_compression), question_feature(X_feature), question_office(X_office),
text_file(X, X_text_file), content(X, X_content), compression(X, X_compression), feature(X, X_feature), office(X, X_office),
string_upper(X, X_upper), write("\nI guessed it! Your file format is "), write(X_upper), write(".");
write("\nSorry, I couldn't guess your file format."), fail.
