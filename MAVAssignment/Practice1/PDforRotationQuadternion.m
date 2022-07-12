function  PDforRotationQuadternion()
clc; 
clear all; close all;
x0 = [1;0;0;0;0;0;0]; % x0 is the intial state of the system

tspan=[0; 0.1]; % simulation time
[t,x] = ode45(@sys_dynamics,tspan,x0);

 % plot the simulation data
figure;
% subplot(1,2,1);
plot(t,x(:,1),t,x(:,2)); legend('w','x');title('Rotate around X axis when kp=400 kd=4');
end

function dx=sys_dynamics(t,x)
I=[5.5*10^(-7) 0 0;0 5.5*10^(-7) 0;0 0 11*10^(-7)];

dx=zeros(7,1);

% x(1:4).'*x(1:4)
dq=1/2*quatmultiply(x(1:4).',[0;x(5:7)].');%dq=1/2*q*[0;w]
dx(1:4)=dq.'-dot(dq.',x(1:4))*x(1:4);
% dot(dx(1:4),x(1:4))
wb=x(5:7);
dx(5:7)=I\(controller(x)-cross(wb,I*wb));

end





function u=controller(x)
desireq=[sqrt(2)/2 sqrt(2/3)/2 sqrt(2/3)/2 sqrt(2/3)/2];% angle=pi/2 axis=sqrt(1/3)*(1,1,1)
desirew=[0;0;0];

deltaw=x(5:7)-desirew;
deltaq=quatmultiply(x(1:4).',[desireq(1) -desireq(2:4)]);%% q1-q0

SIN=sqrt(1-deltaq(1)^2);
n=deltaq(2:4)/SIN;


u=-400*eye(3)*n.'-4*eye(3)*deltaw;%u=-kd*n-kp*w

end



