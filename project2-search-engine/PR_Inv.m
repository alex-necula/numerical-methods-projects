function B = PR_Inv(A)
	% algoritmul Gramm-Schmidt este cel invatat in Laboratorul 3
	I = eye(N);
	[Q, R] = GrammSchmidt(A); % descompunem matricea care trebuie inversata

	B = zeros(N); % initializare matrice inversa
	for i = 1:N
		B(:, i) = SST(R, Q' * I(:, i)); % rezolvam SST pentru fiecare coloana
	endfor
endfunction