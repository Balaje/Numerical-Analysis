% Program to demonstrate Jacobi Method

clc
n = input('Enter the number of variables: ');

%Input coefficient matrix.
A = zeros(n,n); %Initialize
fprintf('Enter coefficient matrix: \n');
for i=1:n
  for j=1:n
    p = num2str(i);
    q = num2str(j);
    str = strcat('Enter element in row (', p , ') column (', q , ') : ');
    A(i,j) = input(str);
  end
end

%Input constant matrix.
B = zeros(1,n); %Initialize
fprintf('Enter constant matrix (RHS): \n');
for i=1:n
  str = strcat('Enter B[',num2str(i),'] :');
  B(i) = input(str);
end

%Show the matrices
A
B

%Initialize solution matrices with zeros
x = zeros(1,n);
y = zeros(1,n);

fprintf('Enter initial approximation: \n');
for i=1:n
	str = strcat('x[',num2str(i),']: ');
	x(i)=input(str);
end

tol = input('Enter tolerance: ');

%Run the algorithm
N=1000;
for k=1:N
	sum=0;
	for i=1:n
		sum=0;
		for j=1:n
			if (i ~= j)
				sum = sum+A(i,j)*x(j);
				y(i) = (-sum+B(i))/A(i,i);
			end			
		end
	end
	y

	if(norm(y-x,inf) <= tol)
		clc
		fprintf('Solution is : \n');
		y
		fprintf('\nNumber of iterations : %d\n',k);
		return ;
	end
	x = y;
end

fprintf('Maximum number of iterations reached\n');




