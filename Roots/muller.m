%Program to demonstrate Muller Method.

clc;
syms x;

func = input('Enter function (variable in x): ');

f = inline(func);
x0 = input('Enter first guess: ');
x1 = input('Enter second guess: ');
x2 = input('Enter third guess: ');
ep = input('Enter tolerance: ');

N = 1000;

k=1;

while k<=N
	h1 = x1-x0;
	h2 = x2-x1;
	d1 = (f(x1)-f(x0))/h1;
	d2 = (f(x2)-f(x1))/h2;

	%a,b,c of the parabola a(x-x2)^2+b(x-x2)+c;
	a = (d2-d1)/(h1+h2);
	b = a*h2+d2;
	c = f(x2);

	%Evaluating x3;
	D = sqrt(b^2 - 4*a*c);
	if(b<0)
		E = b-D;
	else 
		E = b+D;
	end
	
	x3 = x2 - (2*c/E);			

	%fprintf('a = %f \t b = %f \t c = %f \t x3 = %f \t x2 = %f \t x1 = %f \n', a, b, c, x3, x2, x1); 

	x3
	x2
	if(abs(x3-x2) <= ep)
		%fprintf('\nSolution is = %f\n', x3); "%Only the real part"
		fprintf('\nSolution is = %f+%fi\n', real(x3), imag(x3)); %Complex number..
		fprintf('Number of iterations = %d\n', k);
		return;
	end
	
	k = k+1;
	x0 = x1;
	x1 = x2;
	x2 = x3;
end
fprintf('Maximum number of iterations reached..\n');
