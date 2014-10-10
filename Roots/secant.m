%Program to demonstrate Secant Method.

clc;
syms x;
func = input('Enter function (variable in x): ');
x0 = input('Enter first guess: ');
x1 = input('Enter second guess: ');
ep = input('Enter tolerance: ');

f = inline(func);

i=1;
N = 1000;

k=1;
while i<=N
	y = x1 - f(x1)*  (x1-x0)/(f(x1) - f(x0)) ;
	
	fprintf('y = %f \t f(y) = %f \t |y-x1| = %f \n',y,f(y),abs(y-x1));
	
	if(abs(y-x1) <= ep)
		fprintf('Solution is : %f\n', y);
		fprintf('Number of iterations : %d\n', i);
		return;
	end
	
	i = i+1;
	x0 = x1;
	x1 = y;
end

fprintf('\nMaximum iterations reached..\n');


