% Fixed Point method

clc
syms x

s = input('Enter the iteration function g(x): ');

g = inline(s);
eps = input('Input Tolerance: '); % --- Tolerance ---

N = 1000;
i = 1;

x0 = input('Enter initial guess: '); % --- Initial guess ---

% ----- Main Algorithm -----
while i<=N
	y = g(x0);

	fprintf('y = %f \t |y-x0| = %f \n', y, abs(y-x0));

	if(abs(y-x0) < eps)
		fprintf('Solution is : %f\n\n', y);
		fprintf('\n Number of iterations %d\n\n\n', i);
		return 
	end
	
	x0 = y;
	i = i+1;
end	

fprintf('\nSolution did not converge..');

