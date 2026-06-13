G = 6.674e-11;
M = 2e30;
dt = 1000;
r_peri = 1.471e11;

e_val = [0.0164, 0.5];
colors = ['b', 'r'];
labels = {'e = 0.0164 (Earth)', 'e = 0.5 (Exaggerated)'};

figure;
hold on;

for k = 1:2
    e = e_val(k);
    a = r_peri / (1 - e);
    v_peri = sqrt(G*M/a * (1+e)/(1-e));
    T = 2*pi*sqrt(a^3/(G*M));
    
    t = 0:dt:T;
    r         = zeros(size(t));
    r_dot     = zeros(size(t));
    theta     = zeros(size(t));
    theta_dot = zeros(size(t));
    
    r(1)         = r_peri;
    r_dot(1)     = 0;
    theta(1)     = 0;
    theta_dot(1) = v_peri / r_peri;

    for i = 1:length(t)-1
        k1_Y1 = r_dot(i);
        k1_Y2 = -G*M / (r(i)^2) + r(i)*(theta_dot(i)^2);
        k1_Y3 = theta_dot(i);
        k1_Y4 = -2*theta_dot(i)*r_dot(i)/r(i);
    
        r2    = r(i)         + 0.5*dt*k1_Y1;
        rd2   = r_dot(i)     + 0.5*dt*k1_Y2;
        th2   = theta(i)     + 0.5*dt*k1_Y3;
        td2   = theta_dot(i) + 0.5*dt*k1_Y4;
    
        k2_Y1 = rd2;
        k2_Y2 = -G*M/r2^2 + r2*td2^2;
        k2_Y3 = td2;
        k2_Y4 = -2*rd2*td2/r2;
    
        r3    = r(i)         + 0.5*dt*k2_Y1;
        rd3   = r_dot(i)     + 0.5*dt*k2_Y2;
        th3   = theta(i)     + 0.5*dt*k2_Y3;
        td3   = theta_dot(i) + 0.5*dt*k2_Y4;
    
        k3_Y1 = rd3;
        k3_Y2 = -G*M/r3^2 + r3*td3^2;
        k3_Y3 = td3;
        k3_Y4 = -2*rd3*td3/r3;
    
        r4    = r(i)         + dt*k3_Y1;
        rd4   = r_dot(i)     + dt*k3_Y2;
        th4   = theta(i)     + dt*k3_Y3;
        td4   = theta_dot(i) + dt*k3_Y4;
        
        k4_Y1 = rd4;
        k4_Y2 = -G*M/r4^2 + r4*td4^2;
        k4_Y3 = td4;
        k4_Y4 = -2*rd4*td4/r4;
    
        r(i+1)     = r(i)     + (dt/6)*(k1_Y1 + 2*k2_Y1 + 2*k3_Y1 + k4_Y1);
        r_dot(i+1) = r_dot(i) + (dt/6)*(k1_Y2 + 2*k2_Y2 + 2*k3_Y2 + k4_Y2);
        theta(i+1) = theta(i) + (dt/6)*(k1_Y3 + 2*k2_Y3 + 2*k3_Y3 + k4_Y3);
        theta_dot(i+1) = theta_dot(i) + (dt/6)*(k1_Y4 + 2*k2_Y4 + 2*k3_Y4 + k4_Y4);
    end

    x_cart = r .* cos(theta);
    y_cart = r .* sin(theta);
    plot(x_cart, y_cart, colors(k), 'DisplayName', labels{k});
end

plot(0, 0, 'yo', 'MarkerSize', 20,'DisplayName', 'SUN');
xlabel('X (m)'); 
ylabel('Y (m)');
title('Keplerian Orbits — Eccentricity Comparison');
axis equal; 
grid on; 
legend;
