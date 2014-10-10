% Bisection method

clc
syms x
func = input('Enter the function g(x): ');

f = inline(func);

a = input('Enter lower limit: ');
b = input('Enter upper limit: ');

eps = input('Enter Tolerance: '); % ---Tolerance---

% --- Main Algorithm ---
for i=1:1000
	if (f(a)*f(b) < 0)
	        y = (a+b)/2;

		if (f(a)*f(y) < 0)
			b = y;
			fprintf('f(a)*f(y) = %f\n', f(a)*f(y));
			fprintf('a = %f\t, b = %f\t, y = %f\t\n', a, b, y);
 		else 
     			a = y;
			fprintf('f(a)*f(y) = %f\n', f(a)*f(y));
			fprintf('a = %f\t,b = %f\t, y = %f\t\n', a, b, y);
		end;

		if(abs(a-b) <= eps)
			fprintf('\n\nNo of iterations = %d\n', i);	
    			fprintf('\n\nSolution = %f\n', y);
			return ;
		end;
	end;
end;
fprintf('\nSolution did not converge.\n');
