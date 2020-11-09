function [M, N] = createMatrix(nume)
	% functie care creeaza matricea M din pseudocod pe baza matricei de adiacenta

    fid = fopen(nume, 'r'); % deschidere fisier
	N = fscanf(fid, "%f", 1); % numarul de noduri
	A = zeros(N); % initializare matrice de adiacenta
	L = zeros(N, 1); % numarul de linkuri al fiecarei pagini

	for i = 1:N
		[~, linksNo] = fscanf(fid, "%f %f", "C");
		links = fscanf(fid, "%f", linksNo);
		A(i, links) = 1; % creare matrice de adiacenta
		L(i) = linksNo; 
		if (A(i,i) == 1)
			A(i, i) = 0; % eliminare linkuri catre pagina insasi
			L(i) = L(i) - 1;
		endif
	endfor

	fclose(fid); % inchidere fisier

	inv_K = zeros(N); % initializare matrice diagonala
	% inversul unei matrice diagonale este egala cu matricea cu 
	% inversul elementelor de pe diagonala
	for i = 1:N
		inv_K(i,i) = 1 / L(i);
	endfor
	
	M = (inv_K * A)';
endfunction 