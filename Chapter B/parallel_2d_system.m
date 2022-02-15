function states = parallel_2d_system(t,x,A_array,B_array,u,gamma1,gamma2)
real_x=[x(1); x(2)];
x_estimate=[x(3); x(4)];
A_estimate=[x(5) ,x(6) ;x(7) x(8)];
B_estimate=[x(9); x(10)];
states(1:2)=A_array*real_x+B_array*u(t);
states(3:4)=A_estimate*x_estimate+B_estimate*u(t);
error=real_x-x_estimate;
Adot=gamma1*error*transpose(x_estimate);
states(5:8)=[Adot(1), Adot(2); Adot(3), Adot(4)];
Bdot=gamma2*error*u(t);
states(9:10)=[Bdot(1); Bdot(2)];
states=states';
end

