function  PDforRotation()
clc; 
clear all; close all;
x0 = [0;0;0;0;0;0]; % x0 is the intial state of the system

tspan=[0; 0.1]; % simulation time
[t,x] = ode45(@sys_dynamics,tspan,x0);

 % plot the simulation data
figure;
% subplot(1,2,1);
plot(t,x(:,1)); legend('\phi');title('Rotate around X axis when kp=400 kd=4');
%subplot(1,2,2);plot(t,x(:,4)); legend('\phi^{o}');
% subplot(1,2,1);plot(t,x(:,2)); legend('\theta');title('Rotate around Y axis when kp=400 kd=4');
% subplot(1,2,2);plot(t,x(:,5)); legend('\theta^{o}');
% subplot(1,2,1);plot(t,x(:,3)); legend('\psi');title('Rotate around Z axis when kp=400 kd=4');
%  subplot(1,2,2);plot(t,x(:,6)); legend('\psi^{o}');
% figure; plot(t,x(:,1),t,x(:,2),t,mod(x(:,3),pi*2)); legend('\phi','\theta','\psi'); title('angle'); 
% figure(2); plot(t,x(:,4),t,x(:,5),t,x(:,6)); legend('\phi^{.}','d\theta^{.}','d\psi^{.}'); title('angular velocity'); 
end

function dx=sys_dynamics(t,x)
I=[5.5*10^(-7) 0 0;0 5.5*10^(-7) 0;0 0 11*10^(-7)];

dx=zeros(6,1);

%x(1-3)=Euler angle: phi theta psi
%x(4-6)=Angular velocity in body frame: wbx wby wbz

dx(1:3)=T(x(1:3))\x(4:6);
wb=x(4:6);
dx(4:6)=I\(controller([x(1:3);dx(1:3)])-cross(wb,I*wb));

end



function matrix=T(x)
matrix=[cos(x(3))*cos(x(2)) -sin(x(3)) 0;sin(x(3))*cos(x(2)) cos(x(3)) 0;-sin(x(2)) 0 1];
end

function u=controller(inputX)
desirex=[1;0;0;0;0;0];
deltax=inputX-desirex;
u=zeros(3,1);

kpx=400;
kdx=4;
u(1)=-kpx*deltax(1)-kdx*deltax(4);
if abs(u(1))>0.56
    u(1)=u(1)*0.56/abs(u(1));
end

% kpy=400;
% kdy=4;
% u(2)=-kpy*deltax(2)-kdy*deltax(5);
% if abs(u(2))>0.56
%     u(2)=u(2)*0.56/abs(u(2));
% end

% kpz=400;
% kdz=4;
% u(3)=-kpz*deltax(3)-kdz*deltax(6);
% if abs(u(3))>0.56
%     u(3)=u(3)*0.56/abs(u(3));
% end
end

