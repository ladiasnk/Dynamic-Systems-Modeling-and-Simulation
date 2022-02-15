function states = system(t,x,a,b,u,am,gamma)
states(1)=-a*x(1)+b*u(t);
%error definitions x_real-x_estimate
error=x(1)-( x(4)*x(2)+x(3)*x(5)  ); %x_estimate=vector multiplication of phi and theta^transpose
states(2)=gamma*error*x(4); 
states(3)=gamma*error*x(5); 
states(4)=-am*x(4)+x(1);
states(5)=-am*x(5)+u(t);
states=states';

end

