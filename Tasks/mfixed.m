
global tolerance maxits
tolerance = 1e-4;
maxits = 30;
[root, iflag] = fixed('eqn', 0.2);
switch iflag
    case -1
        disp('Root finding failed')
    otherwise 
        disp(['Root = ' num2str(root) ...
            ' found in ' num2str(iflag) ' iterations'])
end