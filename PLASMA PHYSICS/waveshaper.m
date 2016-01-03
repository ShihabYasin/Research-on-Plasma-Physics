clc
clear all

N=50; % number of grid points
x = linspace(-100,100,N);
dx=x(2)-x(1);%spatial step size
u0=zeros(1,N); % vector of initial u values filled with zeros
eta=zeros(1,N);
for k=1:1:N
u0(k) = 1;
end
u0=[0 u0 0 0];
u=zeros(N,N); % define correct sized numerical solution array
u(1,:)=u0(2:1:(end-2));
hold on
% ---------------------------------------
t=linspace(-100,100,N);
dt=t(2)-t(1);
for m=1:1:(N-1)
for n=2:1:(N-2)
u(m+1,n-1)=u(m,n-1)...
    - ((0.1/(2*t(m)))*0.5*(u0(n)+u0(n-1))...
    - 0.2*0.5*(u0(n)+u0(n-1))*(u0(n+1)-u0(n))/dx...
    - 0.3*(u0(n+2)-3*u0(n+1)+3*u0(n)-u0(n-1))/(dx^3))*dt;
end
u0(2:1:(end-2))=u(m+1,:); % copy solution to initial conditions for next iteration
end
[mX,mT]=meshgrid(x,t);
figure,surf(mX,mT,u);
xlabel('x');
ylabel('t');
zlabel('u');