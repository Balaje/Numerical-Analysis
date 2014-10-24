%Program to find the Interpolating polynomial using Lagrange Method

clc
syms x;
n = input('Enter the number of data points: ');

%Data Point array
xi = zeros(1,n);
fxi = zeros(1,n);

%Getting the values
choice = input('\n1.For entering the function values independently \n2.For entering the function in x \nEnter Choice: ');

if(choice > 2 || choice < 1)
  exit
end

%Input the data points from the user
if(choice == 1)
  for i=1:n
    xi(i) = input('Enter data point: ');
    str = strcat('Enter function value at the data point(',num2str(i), ') : ');
    fxi(i) = input(str);
  end
end

%Function to interpolate
if(choice == 2)
  func = input('Enter function: ');
  f = inline(func);
  for i=1:n
    xi(i) = input('Enter data point: ');
    fxi(i) = double(f(xi(i)));
  end
end
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
    p = (p+L*double(fxi(j)));
  
end

fprintf('\n\nThe interpolating polynomial is given by: \n\n');
poly = vpa(collect(p), 4);
disp(poly);

x = [0:0.5:5];
y = polyval(sym2poly(poly), x);
plot(x,y);
grid on;
hold on;
for i=1:n
    plot(xi(i), f(xi(i)), 'ro');
end
hold off;

