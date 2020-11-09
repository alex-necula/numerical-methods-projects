function R = Iterative(nume, d, eps)
	[M, N] = createMatrix(nume); % calculam matricea M

	prev_R(1:N, 1) = 1 / N; % initializare R

	while 1
		R =  d * M * prev_R + (1 - d) / N * ones(N, 1);
		err = norm(R - prev_R);
		if (err < eps) 
			R = prev_R; % returnam iteratia anterioara
			return;
		endif;
		prev_R = R;
	end
	
endfunction