function charnum = char_counter(fname,character)
fid = fopen(fname,'r');
if fid < 0
    charnum = -1;
    return
end
if ischar(character) == 0
    charnum = -1;
    return
end
str = fscanf (fid, '%c');
charnum = count(str, character);
end