clear all;
clear variables;
clc;
workspace;
clear figures;


%system parameters
x_initial=0;
u=@(t) 5*sin(3*t);
%declare parameters values that will be estimated
a=2;
b=1;
%filter pole :(am)
am=2;
%positiive value gamma estimator, more details regarding this on the report
gamma_estimator=30; 
phi1_initial=0;
phi2_initial=0;
theta1_initial=0;
theta2_initial=0;
%initial values grouped
initials=[x_initial,phi1_initial, phi2_initial, theta1_initial,theta2_initial];
time=0:0.1:10;
%simulate system using given differential equation for xdot=-ax+bu ,x(0)=0
%now the real_x array hold all real x values
[t,x]=ode45(@(t,x) ...
    system(t,x,a,b,u,am,gamma_estimator),time,initials);
%now obtain all parameters through x collumns
x_real=x(:,1);
theta1=x(:,2);
theta2=x(:,3);
phi1=x(:,4);
phi2=x(:,5);
%a estimated using the first element of theta array
a_estimates=am-theta1;
%b estimatedusing the second element of theta array
b_estimates=theta2;

figure(1)
plot(x_real);
hold on;
x_estimate=theta1.*phi1+theta2.*phi2;
plot(x_estimate);
legend('real x','x estimated')
title('Real x and x estimated using the gradient method')
%subplot for the a and b estimations
figure(2)
subplot(1,2,2)
plot1=subplot(2,1,1);
plot(b_estimates)
title("a estimations");
ylabel("a parameter estimations");
xlabel("Time(s^{-1})");

plot2=subplot(2,1,2);
plot(a_estimates);
title("b estimations");
ylabel("b parameter estimations");
xlabel("Time(s^{-1})");




