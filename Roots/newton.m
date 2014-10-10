%Program to demostrate newton method

clc
syms x
func = input('Enter a function (variable in x): ');

f = inline(func);
d = diff(func);

df = inline(d);

y = input('Enter a close value to the root: ');
epsilon = input('Enter Tolerance value: '); % --- Tolerance ---

i = 1;
N = 1000;

%--- Main Algorithm ---
while i<=N
	x_i1 = y - (f(y) / df(y));
	
	fprintf('f(xi) = %f \t |y-xi| = %f \n', x_i1, abs(y-x_i1));

	if(abs(y - x_i1) < epsilon)
		fprintf('Solution is %f\n\n', x_i1);
        	fprintf('\n Number of iterations %d\n\n\n', i);
		return;
	end
	
	i = i+1;
	y = x_i1;
end

fprintf('\n\nSolution did not converge!!');
	
