dt = 1000;
M = 1.9891e30;
G = 6.67430e-11;
t = 0:dt:3.1536e7;
x = zeros(size(t));
y = zeros(size(t));
vx = zeros(size(t));
vy = zeros(size(t));
x(1) = 1.496e11;
y(1) = 0;
vx(1) = 0;
vy(1) = 29780;
for i=1:length(t)-1
    
    r1 = sqrt(x(i)^2 + y(i)^2);
    k1_x = vx(i);
    k1_y = vy(i);
    k1_vx = -G * M * x(i) / r1^3;
    k1_vy = -G * M * y(i) / r1^3;
   
    r2 = sqrt((x(i) + 0.5*dt*k1_x)^2 + (y(i) + 0.5*dt*k1_y)^2);
    k2_x = vx(i) + 0.5*dt*k1_vx;
    k2_y = vy(i) + 0.5*dt*k1_vy;
    k2_vx = -G * M * (x(i) + 0.5*dt*k1_x) / r2^3;
    k2_vy = -G * M * (y(i) + 0.5*dt*k1_y) / r2^3;

    r3 = sqrt((x(i) + 0.5*dt*k2_x)^2 + (y(i) + 0.5*dt*k2_y)^2);
    k3_x = vx(i) + 0.5*dt*k2_vx;
    k3_y = vy(i) + 0.5*dt*k2_vy;
    k3_vx = -G * M * (x(i) + 0.5*dt*k2_x) / r3^3;
    k3_vy = -G * M * (y(i) + 0.5*dt*k2_y) / r3^3;

    r4 = sqrt((x(i) + dt*k3_x)^2 + (y(i) + dt*k3_y)^2);
    k4_x = vx(i) + dt*k3_vx;
    k4_y = vy(i) + dt*k3_vy;
    k4_vx = -G * M * (x(i) + dt*k3_x) / r4^3;
    k4_vy = -G * M * (y(i) + dt*k3_y) / r4^3;

    x(i+1) = x(i) + (dt/6) * (k1_x + 2*k2_x + 2*k3_x + k4_x);
    y(i+1) = y(i) + (dt/6) * (k1_y + 2*k2_y + 2*k3_y + k4_y);
    vx(i+1) = vx(i) + (dt/6) * (k1_vx + 2*k2_vx + 2*k3_vx + k4_vx);
    vy(i+1) = vy(i) + (dt/6) * (k1_vy + 2*k2_vy + 2*k3_vy + k4_vy);
end
figure;
plot(x, y,'r');
hold on;
plot(0,0,'y.',MarkerSize=100);
plot(x(1),0,'g.', MarkerSize=50)
xlabel('X Position (m)');
ylabel('Y Position (m)');
axis equal;
grid on;
legend('Earth Orbit', 'Sun', 'Initial Position');
title('Orbit Simulation of the Earth');
