function open_webpage
url = input('Enter the url: ', 's'); % char works with input, 
                                     % not string for this version of
                                     % MATLAB
if isempty(url)
    fprintf("No url entered, so quitting.\n");
    return;
end
search_time = datetime; %same as datetime("now")
status = web(url);
if status == 0 % started web browser
    fprintf("At %s, you opened the web page at\n", search_time);
    fprintf("%s\n", url);
else
    fprintf("Could not start web browser\n");
end
[~, weekday_name] = weekday(search_time, 'long'); 
            % weekday returns week day index which is ignored by the "~"
            % long format is to spell out the name of the day in full
fprintf("Have a great %s!\n", weekday_name);