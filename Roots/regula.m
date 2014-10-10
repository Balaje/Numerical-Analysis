% False Postion Method

clc;
syms x;
func = input('Enter function (variable in x): ');

x0 = input('Enter lower limit: ');
x1 = input('Enter upper limit: ');
ep = input('Enter tolerance: ');

f = inline(func);

i=1;
N = 1000;

k=1;
while i<=N
	y = x1 - f(x1)*  (x1-x0)/(f(x1) - f(x0)) ;
	if(f(y) == 0.0)
		fprintf('Solution is : %f\n', y);
		return ;
	end
	
	fprintf('y = %f \t f(y) = %f \t x0 = %f \t f(x0) = %f \t x1 = %f \t f(x1)= %f  \t |y-x1| = %f \n', y, f(y), x0, f(x0), x1, f(x1), abs(y-x1));
	
	if(f(x1)*f(y) < 0)
		x0 = x1;
	end

	if(abs(y-x1) <= ep)
		fprintf('Solution is : %f\n', y);
		fprintf('Number of iterations : %d\n', i);
		return;
	end
	
	i = i+1;
	x1 = y;
end

fprintf('\nMaximum iterations reached..\n');
