function coded = caesar(v, n)
temp = double(v);
% num = temp;
N = n - 95*fix(n/95)
for i = 1:length(v)
    if temp + N > 126
        coded = char(temp + N - 127 + 32);
    elseif temp + n < 32
        coded = char(126 -31 - temp - n);
    else
        coded = char(temp + n);
    %elseif temp - n < 32
     %   coded = char(32 + n 
    end
    
end
%coded = sprintf('%s', temp);
end

%
% function txt = caesar(txt,key)
  %  txt = double(txt) + key;
   % first = double(' ');
   % last = double('~');
    % use mod to shift the characters - notice the + 1
    % this is a common error and results in shifts 
    % being off by 1
    %txt = char(mod(txt - first,last - first + 1) + first);
%end

% Another approach
%function y = caesar2(ch, key)
  %  v = ' ' : '~';
  %  [~, loc] = ismember(ch, v);
   % v2 = circshift(v, -key);
  %  y = v2(loc);
%end

%
        