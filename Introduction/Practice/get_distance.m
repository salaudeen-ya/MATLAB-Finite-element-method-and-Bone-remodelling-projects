function distance = get_distance(x, y)
[~, ~, data] = xlsread('Distances.xlsx');
row = data(1, :);
col = data(:, 1);

for i = 2:length(row)
    if strcmp(row(i), x)
        x = i;
        break;
    end
end
for j = 2:length(col)
    if strcmp(col(j), y)
        y = j;
        break;
    end
end

if (strcmp(row(i), x)) && (strcmp(col(j), y))
    distance = data{x, y};
else
    distance = -1;
end
end
        