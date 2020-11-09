function [R1 R2] = PageRank(nume, d, eps)

	R1 = Iterative(nume, d, eps)
	R2 = Algebraic(nume, d, eps);

	[val1, val2] = readValues(nume);

	outputName = strcat(nume, ".out"); % creare nume fisier output
	fid = fopen(outputName, "w"); % deschidere fisier pentru scriere
	
	N = size(R1, 1);
	fprintf(fid, "%d\n\n", N);
	fprintf(fid, "%f\n", R1);
	fprintf(fid, "\n");
	fprintf(fid, "%f\n", R2);
	fprintf(fid, "\n");

	R = sort(R2, "descend"); % sortare descrescatoare vector PR
	for i = 1:N
		j = find(R2 == R(i)); % nodul al carui PageRank este PR(i)
		y = Apartenenta(R(i), val1, val2); % valoarea functiei
		fprintf(fid, "%d %d %f\n", i, j, y);
	endfor

	fclose(fid); % inchidere fisier
endfunction;
	