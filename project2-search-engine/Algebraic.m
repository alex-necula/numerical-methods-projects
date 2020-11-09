function R = Algebraic(nume, d)
	[M, N] = createMatrix(nume); % calculam matricea M
	inv_ = PR_Inv(I - d * M); % calculam inversa matricei din formula

	R = inv_ * (1 - d) / N * ones(N, 1);
endfunction