% Program to demonstrate Newton's divided difference Method
clc
syms x;
syms s;

fprintf('\n\n\tUse only for equally spaced data points');
n = input('Enter the number of data points: ');

%Initialize data point array.
xi = zeros(1,n);
fxi = zeros(1,n);

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

if(choice == 2)
  func = input('Enter function wrt x: ');
  fx = inline(func);
  for i=1:n
    xi(i) = input('Enter data point: ');
    fxi(i) = double(fx(xi(i)));
  end
end

h = xi(2) - xi(1);
%Compute the divided difference D(i,j);
D = zeros(n,n);
D(:,1) = fxi';
for j=2:n
  for k=j:n
      D(k,j) = (D(k,j-1)-D(k-1,j-1))/(xi(k)-xi(k-j+1));
  end
end

%Compute the polynomial where f[x0,x1..,xn] = D(n,n) 
% -- Variable in s
sum = D(1,1);
product = 1;
for i=2:n
    product = product*(s-i+2)*h;
    sum = sum + product*D(i,i);
end

%Display the polynomial

% -- Change Variable from s to x
s = (x-xi(1))/h;
sum = poly2sym(sym2poly(sum), s);

fprintf('\n\nThe interpolating polynomial is \n');
poly = vpa(collect(sum), 4);
disp(poly);

%Plot the polynomial
x = [0:0.5:5];
y = polyval(sym2poly(poly), x);
plot(x,y);
grid on;
hold on;
for i=1:n
  plot(xi(i), fxi(i), 'ro');
end
hold off;
