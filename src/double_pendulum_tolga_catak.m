%=================================%
% ME 303 PROJECT ASSIGNMENT 2
% Question 2
% 2018405144-Tolga Çatak

% Double Pendulum Motion

clear all
close all
clc

format long

%%
%======Define the given parameters======%

% Define the mass of the bobs, the lengths of the rods and the gravity constant
m1  = 1;                       
m2  = 1;                        
L1  = 0.1;                        
L2  = 0.1;                       
g   = 9.81;    

% Define the reduced mass of the second bob
u2 = m2/(m2+m1);

% Define the time interval and the step size
tmin = 0;
tmax = 20;

h=0.001;

t = tmin:h:tmax;

% Define the number of iteration
M = (tmax-tmin)/h;

%%
%======Define the equations======%

% Define the equations as a system of first order differential equations

%z1=theta1
%z2=theta1'
%z3=theta2
%z4=theta2'

%z1'=theta1'
%z2'=theta1''
%z3'=theta2'
%z4'=theta2''

% Define the matrices A and B 
A = cell(2,2);
B = cell(2,1);

A{1,1} = @(t,z1,z2,z3,z4) L1;
A{1,2} = @(t,z1,z2,z3,z4) u2*L2*cos(z1-z3);
A{2,1} = @(t,z1,z2,z3,z4) L1*cos(z1-z3);
A{2,2} = @(t,z1,z2,z3,z4) L2;

B{1} = @(t,z1,z2,z3,z4) -g*sin(z1)-u2*L2*sin(z1-z3)*z4^2;
B{2} = @(t,z1,z2,z3,z4) -g*sin(z3)+L1*sin(z1-z3)*z2^2;

% Define the slope functions
f1 = @(t,z1,z2,z3,z4) z2;
f2 = @(t,z1,z2,z3,z4) (A{2,2}(t,z1,z2,z3,z4)*B{1}(t,z1,z2,z3,z4)-A{1,2}(t,z1,z2,z3,z4)*B{2}(t,z1,z2,z3,z4))/(A{1,1}(t,z1,z2,z3,z4)*A{2,2}(t,z1,z2,z3,z4)-A{1,2}(t,z1,z2,z3,z4)*A{2,1}(t,z1,z2,z3,z4));
f3 = @(t,z1,z2,z3,z4) z4;
f4 = @(t,z1,z2,z3,z4) (-A{2,1}(t,z1,z2,z3,z4)*B{1}(t,z1,z2,z3,z4)+A{1,1}(t,z1,z2,z3,z4)*B{2}(t,z1,z2,z3,z4))/(A{1,1}(t,z1,z2,z3,z4)*A{2,2}(t,z1,z2,z3,z4)-A{1,2}(t,z1,z2,z3,z4)*A{2,1}(t,z1,z2,z3,z4));

% Preallocate space
z1 = zeros(1,M);
z2 = zeros(1,M);
z3 = zeros(1,M);
z4 = zeros(1,M);

% Define the initial values
z1_0 = pi/2;
z2_0 = 0;
z3_0 = pi/2;
z4_0 = 0;

% Assign the initial values to the arrays
z1(1)=z1_0;
z2(1)=z2_0;
z3(1)=z3_0;
z4(1)=z4_0;

%%
%======Apply the Runge-Kutta of Order N=4 Method======%

for k=1:M
    f1_1=f1(t(k),z1(k),z2(k),z3(k),z4(k));
    f2_1=f2(t(k),z1(k),z2(k),z3(k),z4(k));
    f3_1=f3(t(k),z1(k),z2(k),z3(k),z4(k));
    f4_1=f4(t(k),z1(k),z2(k),z3(k),z4(k));
    
    f1_2=f1(t(k)+h/2,z1(k)+h/2*f1_1,z2(k)+h/2*f2_1,z3(k)+h/2*f3_1,z4(k)+h/2*f4_1);
    f2_2=f2(t(k)+h/2,z1(k)+h/2*f1_1,z2(k)+h/2*f2_1,z3(k)+h/2*f3_1,z4(k)+h/2*f4_1);
    f3_2=f3(t(k)+h/2,z1(k)+h/2*f1_1,z2(k)+h/2*f2_1,z3(k)+h/2*f3_1,z4(k)+h/2*f4_1);
    f4_2=f4(t(k)+h/2,z1(k)+h/2*f1_1,z2(k)+h/2*f2_1,z3(k)+h/2*f3_1,z4(k)+h/2*f4_1);
    
    f1_3=f1(t(k)+h/2,z1(k)+h/2*f1_2,z2(k)+h/2*f2_2,z3(k)+h/2*f3_2,z4(k)+h/2*f4_2);
    f2_3=f2(t(k)+h/2,z1(k)+h/2*f1_2,z2(k)+h/2*f2_2,z3(k)+h/2*f3_2,z4(k)+h/2*f4_2);
    f3_3=f3(t(k)+h/2,z1(k)+h/2*f1_2,z2(k)+h/2*f2_2,z3(k)+h/2*f3_2,z4(k)+h/2*f4_2);
    f4_3=f4(t(k)+h/2,z1(k)+h/2*f1_2,z2(k)+h/2*f2_2,z3(k)+h/2*f3_2,z4(k)+h/2*f4_2);

    f1_4=f1(t(k)+h,z1(k)+h*f1_3,z2(k)+h*f2_3,z3(k)+h*f3_3,z4(k)+h*f4_3);
    f2_4=f2(t(k)+h,z1(k)+h*f1_3,z2(k)+h*f2_3,z3(k)+h*f3_3,z4(k)+h*f4_3);
    f3_4=f3(t(k)+h,z1(k)+h*f1_3,z2(k)+h*f2_3,z3(k)+h*f3_3,z4(k)+h*f4_3);
    f4_4=f4(t(k)+h,z1(k)+h*f1_3,z2(k)+h*f2_3,z3(k)+h*f3_3,z4(k)+h*f4_3);

    % Calculate the approximated function values for each iteration
    z1(k+1)=z1(k)+h/6*(f1_1+2*f1_2+2*f1_3+f1_4);
    z2(k+1)=z2(k)+h/6*(f2_1+2*f2_2+2*f2_3+f2_4);
    z3(k+1)=z3(k)+h/6*(f3_1+2*f3_2+2*f3_3+f3_4);
    z4(k+1)=z4(k)+h/6*(f4_1+2*f4_2+2*f4_3+f4_4);
end

%%
%======ODE45 Method======%

% Define a function array for ode45 function
f= @(t,z) [z(2);(A{2,2}(t,z(1),z(2),z(3),z(4))*B{1}(t,z(1),z(2),z(3),z(4))-A{1,2}(t,z(1),z(2),z(3),z(4))*B{2}(t,z(1),z(2),z(3),z(4)))/(A{1,1}(t,z(1),z(2),z(3),z(4))*A{2,2}(t,z(1),z(2),z(3),z(4))-A{1,2}(t,z(1),z(2),z(3),z(4))*A{2,1}(t,z(1),z(2),z(3),z(4)));...
    z(4);(-A{2,1}(t,z(1),z(2),z(3),z(4))*B{1}(t,z(1),z(2),z(3),z(4))+A{1,1}(t,z(1),z(2),z(3),z(4))*B{2}(t,z(1),z(2),z(3),z(4)))/(A{1,1}(t,z(1),z(2),z(3),z(4))*A{2,2}(t,z(1),z(2),z(3),z(4))-A{1,2}(t,z(1),z(2),z(3),z(4))*A{2,1}(t,z(1),z(2),z(3),z(4)))];
% Define an initial value array
z0 = [z1_0;z2_0;z3_0;z4_0];
% Use the ode45 function
[t_ode45,z_ode45]=ode45(f,[tmin tmax],z0);

%%
%======Plot and Simulate the Results======%

% Plot the angle vs time graph using rk4 data
subplot(1,3,1)
hold on
grid on
plot(t,z1,'r',LineWidth=3)
plot(t,z3,'g',LineWidth=3)

% Plot the angle vs. time graph using ode45 data
plot(t_ode45,z_ode45(:,1),'b')
plot(t_ode45,z_ode45(:,3),'m')
plot(0,L1+L2, '.k', 'linewidth', 4)
title('Angle vs. Time')
xlabel('x-axis')
ylabel('y-axis')
legend('theta1-rk4','theta2-rk4','theta1-ode45','theta2-ode45')

% Define the Cartesian coordinates of the masses to angles theta1 and heta2 for rk4
x1=L1*sin(z1);
y1=L2+L1-L1*cos(z1);
x2=L1*sin(z1)+L2*sin(z3);
y2=L2+L1-L1*cos(z1)-L2*cos(z3);

% Plot the position of the Bob1 and Bob2 using rk4 data
subplot(1,3,2)
hold on
grid on
plot(x1,y1,'r',LineWidth=2)
plot(x2,y2,'g')
plot(0,L1+L2, '.k', 'linewidth', 4)
title('Position vs. Time - RK4')
xlabel('x-axis')
ylabel('y-axis')
legend('Trajectory of Bob1', 'Trajectory Bob2','Origin');

% Define the Cartesian coordinates of the masses to angles theta1 and theta2 for ode45
x1_ode45=L1*sin(z_ode45(:,1));
y1_ode45=L2+L1-L1*cos(z_ode45(:,1));
x2_ode45=L1*sin(z_ode45(:,1))+L2*sin(z_ode45(:,3));
y2_ode45=L2+L1-L1*cos(z_ode45(:,1))-L2*cos(z_ode45(:,3));

% Plot the position of the Bob1 and Bob2 using ode45 data
subplot(1,3,3)
hold on
grid on
plot(x1_ode45,y1_ode45,'b',LineWidth=2)
plot(x2_ode45,y2_ode45,'m')
plot(0,L1+L2, '.k', 'linewidth', 4)
title('Position vs. Time - ode45')
xlabel('x-axis')
ylabel('y-axis')
legend('Trajectory of Bob1', 'Trajectory Bob2','Origin');

% Extract every nth element of the arrays to arrange the frames.
% This part is necessary since we are using RK4 method to solve the problem
% Normally, frame rate can be adjusted but it works by changing the step size of the solution. 
% We apply this method to keep the step size of the RK4 Method constant while being able to change the frame rate of the animation.
% As an increases, the framerate decreases, i.e. the resolution decreases.
n=20;
x1= x1(1 : n : end);  
y1= y1(1 : n : end);  
x2= x2(1 : n : end);  
y2= y2(1 : n : end);  

% Use cool function to take the colormap
c = cool(6); 

figure
% Adjust the pixels of the animation
set(gcf,'Position',[50 50 640 640])     % Social

% Adjust the coordinate system of the animation
hold on ; grid on ; box on ; axis equal
set(gca,'XLim',[-2*(L1+L2) 2*(L1+L2)])
set(gca,'YLim',[-1*(L1+L2) 2*(L1+L2)])
set(gca,'XTick',[],'YTick',[])

%Choose a color for the background
set(gca,'Color','w')

% Create and open video writer object
v = VideoWriter('double_pendulum_theta2dot=50.mp4','MPEG-4');
v.Quality   = 10;

% Start the animation
open(v);

for i = 1:length(x1)
    cla

    % Animate each of the components
    % The starting point of the rod 1 is corrected with the help of geometry
    % It can be used for any initial condition
    % Choose any desired color for the components

    % Rod 1
    plot([x1(1)-L1*sin(z1_0) x1(i)],[y1(1)+L1*cos(z1_0) y1(i)],'k','LineWidth',2)
    % Rod 2
    plot([x1(i) x2(i)],[y1(i) y2(i)],'k','LineWidth',2)

    % The position of the origin is also corrected
    % It also can be used for any initial condition

    % Origin
    p = plot(x1(1)-L1*sin(z1_0),y1(1)+L1*cos(z1_0),'wo');
    set(p,'MarkerFaceColor','r','MarkerSize',10)

    % Trajectory A
    plot(x1(1:i),y1(1:i),'color',c(2,:),'LineWidth',3)
    % Trajecotry B
    plot(x2(1:i),y2(1:i),'color',c(5,:),'LineWidth',3)
    
    % Position A
    p = plot(x1(i),y1(i),'r');
    set(p,'Marker','o','MarkerFaceColor',c(2,:),'Color','k','MarkerSize',15)
    % Position B
    p = plot(x2(i),y2(i),'g');
    set(p,'Marker','o','MarkerFaceColor',c(5,:),'Color','k','MarkerSize',15)

    title('Double Pendulum')
    xlabel('y1')
    ylabel('y2')

    frame = getframe(gcf);
    writeVideo(v,frame);
end

% Close the animation
close(v);