function [val1, val2] = readValues(nume)
    data = textread(nume, "%f"); % citire date
	n = rows(data);
    val1 = data(n-1);
    val2 = data(n);
endfunction