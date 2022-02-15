clc;
clear figures;
clear;
workspace;
%given data of our model

m=15;
k=2;
b=0.2;
duration=[0 10];
step=0.1;
%u=@(t) 5*sin(2*t)+10.5;

%initial states given zero

initial(1)=0; %position =0
initial(2)=0; %velocity=0;

% simulate

%for our dynamic model, the input argument to ode15s is a function of the
%time and state because m,b,k,u are defined as fixed in the script, then we
%pass the duration of intergation and the initial states
[t,state]=ode15s(@(t,state)dynamic_model(t,state,m,b,k),duration,initial);

% plot results
position=state(:,1);
velocity=state(:,2);
figure
titled=sprintf("Position and velocity with respect to time");
title(titled);
plot(t, position,'LineWidth',2);
hold on;
plot(t, velocity,'LineWidth',2);
legend('Position','Velocity');
xlabel('Time');
ylabel('Values');
