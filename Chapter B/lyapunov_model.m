% ея©тгла 2
%system parameters
clear workspace;
clear figures;
x_initial=0;
u=@(t) 5*sin(3*t);
%declare parameters values that will be estimated
a=2;
b=1;
pi=3.1415;
time=0:0.1:20;
frequency=500;
h0=0.15;
noise=@(t) h0*sin(2*frequency*pi*t);
x_estimate_initial=0;
theta1_estimate_initial=0;
theta2_estimate_initial=0;
gamma1=10;
gamma2=10;
initials=[x_initial,x_estimate_initial,theta1_estimate_initial,theta2_estimate_initial];
%PARALLEL SYSTEM 
[t,y]=ode45(@(t,y) ...
    parallel_system(t,y,a,b,u,gamma1,gamma2,noise),time,initials);
errors_parallel=y(:,2);
figure(1)
new_x=y(:,1);
plot(new_x);
hold on;
y_estimates_parallel=y(:,2);
plot(y_estimates_parallel)
legend('real x','x^')
title('Real x and x estimated using the Lyapunov method(parallel topology)')
figure(2)
a_estimated_parallel=y(:,3);
plot(a_estimated_parallel);
hold on;
b_estimated_parallel=y(:,4);
plot(b_estimated_parallel)
legend('a estimates','b estimates')
title('a and b estimates using the Lyapunov method (parallel topology)')
%MIXED SYSTEM 
theta_em=0.01;
[t,y]=ode45(@(t,y) ...
    mixed_system(t,y,a,b,u,theta_em,gamma1,gamma2,noise),time,initials);
errors_lyapunov=y(:,2);
figure(3)
new_x=y(:,1);
plot(new_x);
hold on;
y_estimates_lyapunov=y(:,2);
plot(y_estimates_lyapunov)
legend('real x','x^')
title('Real x and x estimated using the Lyapunov method(mixed topology)')
figure(4)
a_estimated_lyapunov=y(:,3);
plot(a_estimated_lyapunov);
hold on;
b_estimated_lyapunov=y(:,4);
plot(b_estimated_lyapunov)
legend('a estimates','b estimates')
title('a and b estimates using the Lyapunov method (mixed topology)')