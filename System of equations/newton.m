%Program to illustrate Newton's method to solve a system of Non-Linear equations

clear
clc
n = input('Enter number of variables: ');

%Initialize n variables.
for i=1:n
    	var = strcat('x',num2str(i));
    	varset{i} = var;
    	syms (var);
end

%User input : Initial approximation and functions F(i)
x = zeros(1,n);
fprintf('\tEnter initial approximations and functions(In terms of x1, x2, x3, . . .): \n\n');
for i=1:n
    	%Enter functions
    	str = strcat('Enter function [',num2str(i), ']: ');
    	fi = input(str);

	%Enter initial guess
    	str = strcat('Initial Guess x[',num2str(i),']: ');
    	x(i)=input(str);

    	F(i) = fi;
    
    	fprintf('\n');
end

%Compute jacobian
jak = jacobian(F);

tol = input('Enter tolerance: ');

for k=1:1000
  	%Compute Jacobian at x = [x1, x2, x3, ..]
  	J = subs(jak, varset, x);
  
  	%Compute F at x = [x1, x2, x3, ..]
  	Fk = subs(F, varset, x);
	%Compute v(n)
  	vn = inv(J)*Fk';

  	%Newton method iteration
  	xn1 = x-vn';

  	%Print out the iteration..
  	fprintf('\n\tIteration %d\n', k);
  	fprintf('\n\t-----------\n')

  	fprintf('X(n+1) = ');
  	disp(double(xn1));

  	fprintf('X(n) = ');
  	disp(double(x));

  	%Stopping Condition
  	if(norm(xn1-x, inf) <= tol)
    		fprintf('\nThe solution is: ')
    		disp(double(xn1));
    		return ;
  	end

  	%Initialize for next Iteration
  	x = xn1;
end

fprintf('Maximum iterations reached!');
