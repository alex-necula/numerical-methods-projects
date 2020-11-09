function y = Apartenenta(x, val1, val2)
	a = 1 / (val2 - val1);
	b = - a * val1;
	if (x >= 0 && x < val1) 
		y = 0;
	elseif (x >= val1 && x <= val2)
		y = a * x + b;
	else 
		y = 1;
	endif
endfunction