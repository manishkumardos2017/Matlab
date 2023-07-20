clear all;
clc;
% parameter
l = 0.008;
n = 120;
x=0:0.0008:l;

%boundary condition
T0 = 427; % initial temperature at time=0
T1 = 100; % surface temperatura atx= 0and x=0.008
dt=0.6;  % max.value in which stable condition is satisfied 
dx=0.0008;
time = 0:0.6:100;
alpha = 5.2e-7;
if (dt<(dx*dx/(2*alpha)))
    disp('stability satsified')

    for j = 1:numel(time) 
        for i= 1:numel(x)
            sum =0;
            for k = 1:n
                
                l_m = (k*pi)/l;
                A = (1 - (-1).^(k))/k ;
                C = exp(-alpha*l_m*l_m*time(j));
                B = A * sin(l_m*x(i))*C;
                sum = sum +B;
           
            end
    
            V=(2*(T0 - T1)/pi)*sum;
            T(i,j)= V+T1;
    
        end
        plot(x,T)
        hold on;
    end
    xlabel('X Axis,length','Color','g');
    ylabel('Y Axis, temp.','Color','g');
    title('Solution of the equation for N=120' ,'Interpreter','latex',  'FontSize',14 ,'Color','blue');
else
    disp('stability not satsified')
end