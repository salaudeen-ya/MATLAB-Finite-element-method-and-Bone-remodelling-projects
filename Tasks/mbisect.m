
global tolerance maxits
tolerance = 1e-4;
maxits = 30;
xlower = 0.4;
xupper = 0.6;

[root, iflag] = bisect('func', xlower, xupper);

switch iflag
    case -1
        disp('Root fining failed')
    case -2
        disp('Initial range does not only contain one root')
    otherwise
        disp(['Root = ' num2str(root)...
            ' found in ' num2str(iflag) ' iterations'])
end