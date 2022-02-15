function xdot = mixed_system(t,x,a,b,u,theta_em,gamma1,gamma2,noise)
new_x=x(1)+noise(t);
xdot(1)=-a*new_x+b*u(t);
error=new_x-x(2);
xdot(2)=-x(3)*x(2)+x(4)*u(t)-theta_em*(x(1)-x(2));
xdot(3)=-gamma1*new_x*error;
xdot(4)=gamma2*u(t)*error;
xdot=xdot';
end

