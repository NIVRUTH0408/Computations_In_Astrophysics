r0 = 1.5e11;
M = 2e30;
G = 6.67430e-11; 
R = 6.957e8;
v0 = 0;
dt_eulers = 100000;
t_eulers = 0:dt_eulers:1e8;
r_eulers = zeros(size(t_eulers));
v_eulers = zeros(size(t_eulers));
r_eulers(1) = r0; 
v_eulers(1) = v0; 
for i=1:length(t_eulers)-1
    r_eulers(i+1) = r_eulers(i)+(dt_eulers*v_eulers(i));
    v_eulers(i+1) = v_eulers(i) - (G * M / r_eulers(i)^2) * dt_eulers;
    if r_eulers(i+1)<=R
        t_eulers = t_eulers(1:i+1);
        r_eulers = r_eulers(1:i+1);
        v_eulers = v_eulers(1:i+1);
        break;
    end
end

figure;
subplot(2,1,1);
plot(t_eulers, r_eulers);
xlabel('Time (s)');
ylabel('Distance (m)');
title('Distance vs Time');

subplot(2,1,2);
plot(t_eulers, v_eulers,'r');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');
sgtitle('Free Fall-Eulers Method')
