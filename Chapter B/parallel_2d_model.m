

clear variables;
clear all;
clc;
workspace;
u=@(t) 10*sin(2*t)+5*sin(7.5*t);
%declare parameters values that will be estimated
time=linspace(0,50,500);
A_array=[-0.25, 3;-5 ,-1];
B_array=[1 ; 2.2];
gamma1=5;
gamma2=5;
initials=zeros(10,1);
%PARALLEL 2D SYSTEM 
[t,y]=ode45(@(t,y) ...
    parallel_2d_system(t,y,A_array,B_array,u,gamma1,gamma2),time,initials);
%grab estimated values from ode's returned y as before
x1_real=y(:,1);
x2_real=y(:,2);
x1_estimated=y(:,3);
x2_estimated=y(:,4);
a11_estimated=y(:,5);
a12_estimated=y(:,6);
a21_estimated=y(:,7);
a22_estimated=y(:,8);
b1_estimated=y(:,9);
b2_estimated=y(:,10);
xFitted=0:500;
%subplots for the x1 and x2 estimations on same graphs with their
%corresponding real values
figure(1)
subplot(1,2,2)
plot1=subplot(2,1,1);
plot(x1_real)
hold on;
plot(x1_estimated)
title("x1 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('x1 real','x1 estimated')

plot2=subplot(2,1,2);
plot(x2_real)
hold on;
plot(x2_estimated)
title("x2 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('x2 real','x2 estimated')

%quadrant of subplots for array A elements estimations
figure(2)
plot3=subplot(2,2,1);
plot(xFitted,A_array(1,1)*ones(size(xFitted)))
hold on;
plot(a11_estimated)
title("a11 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('a11 real','a11 estimated')

plot4=subplot(2,2,2);
plot(xFitted,A_array(1,2)*ones(size(xFitted)))
hold on;
plot(a12_estimated)
title("a12 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('a12 real','a12 estimated')

plot5=subplot(2,2,3);
plot(xFitted,A_array(2,1)*ones(size(xFitted)))
hold on;
plot(a21_estimated)
title("a21 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('a21 real','a21 estimated')

plot6=subplot(2,2,4);
plot(xFitted,A_array(2,2)*ones(size(xFitted)))
hold on;
plot(a22_estimated)
title("a22 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('a22 real','a22 estimated')
%Upper and lower subplot again for B array elements estimations
figure(3)
subplot(1,2,2)
plot7=subplot(2,1,1);
plot(xFitted,B_array(1)*ones(size(xFitted)))
hold on;
plot(b1_estimated)
title("b1 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('b1 real','b1 estimated')

plot8=subplot(2,1,2);
plot(xFitted,B_array(2)*ones(size(xFitted)))
hold on;
plot(b2_estimated)
title("b2 response");
ylabel("Values");
xlabel("Time(s^{-1})");
legend('b2 real','b2 estimated')
