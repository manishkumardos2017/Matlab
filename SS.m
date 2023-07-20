clear all; close all;clc;
% Rectangular parameter
l = 20;       %lenght 20 meter
w = 12;        %width 12 meter
N = 200;      %No. of grid 
x=0:0.2:l;   %x direction variation
y=0:0.12:w;   %y direction variation

T1 = 0;      %temperature T1 for right,left,and bottom wall
T2 = 150;    % temperature T2 for top wall
T3 = T2 - T1;
for i= 1:numel(x)
    for j=1:numel(y)
        sum =0;
        for n = 1:N
           
            l_m = (n*pi)/l;
            A = (1 + (-1).^(n +1))/n ;
            B = A * (sin(l_m*x(i))*sinh(l_m*y(j))/sinh(l_m*w));
            sum = sum +B;
       
        end

        T(i,j)= ((2*T3*sum)/pi) + T1;

    end
end



figure(1)
[c,h]=contourf(x,y,T');
clabel(c,h);
colormap(jet)
xlabel('X Axis, length' ,'color','r');
ylabel('Y Axis, width','color','r');
title('Solution of the equation for N=200' ,  'FontSize',14 ,'Color','blue');