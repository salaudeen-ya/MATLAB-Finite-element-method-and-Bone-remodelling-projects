function [value] = userfn(x, par1, par2)
value = x - par1*sin(x.^par2);