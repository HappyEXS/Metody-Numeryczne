
x1_0 = 11; 
x2_0 = 6;
t_span = [0 20];
h0 = 1e-3;
hmin = 1e-5;
eW = 1e-8;
eB = 1e-8;

[t_ode45, x_ode45] = ode45(@trajectory, t_span, [x1_0; x2_0]);
[t_rkf23, x_rkf23, h_rkf23, d_rkf23] = RKF23(@trajectory_v2, t_span, [x1_0; x2_0], h0, hmin, eW, eB);

% Trajektoria na płaszczyźnie (x_1, x_2)
figure;
plot(x_ode45(:, 1), x_ode45(:, 2), x_rkf23(:, 1), x_rkf23(:, 2));
title('Trajektoria (x_1, x_2)');
xlabel('x_1');
ylabel('x_2');
legend('ode45', 'RKF23');

% Trajektoria x_2(t)
figure;
tiledlayout(1, 2);
plot(t_ode45, x_ode45(:, 2), t_rkf23, x_rkf23(:, 2));
title('Trajektoria x_2(t)');
xlabel('t');
ylabel('x_2(t)');
legend('ode45', 'RKF23');

% Trajektoria x_1(t)
figure;
tiledlayout(1, 2);
plot(t_ode45, x_ode45(:, 1), t_rkf23, x_rkf23(:, 1));
title('Trajektoria x_1(t)');
xlabel('t');
ylabel('x_1(t)');
legend('ode45', 'RKF23');