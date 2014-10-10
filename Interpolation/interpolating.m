%Program to find the Interpolating polynomial using Lagrange Method

clc
syms x;
n = input('Enter the number of data points: ');

%Data Point array
xi = zeros(1,n);

%Getting the values
for i=1:n
    xi(i) = input('Enter data point: ');
end;

%Function to interpolate
func = input('Enter function: ');
f = inline(func);

L = 1;
p = 0;

for j=1:n
    L = 1;
    for i=1:n
      if(xi(j) == xi(i))
        continue;
      end
      
      %Finding L(i)
      L = L*((x-xi(i))/(xi(j)-xi(i)));
    end
   
    %Finding the polynomial
    p = (p+L*f(xi(j)));
  
end

fprintf('\n\nThe interpolating polynomial is given by: \n\n');
disp(collect(p));
