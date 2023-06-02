
x1_0 = 11; 
x2_0 = 6;
t_span = [0 20];
h0 = 1e-3;
hmin = 1e-5;
eW = 1e-8;
eB = 1e-8;

[t_ode45, x_ode45] = ode45(@trajectory, t_span, [x1_0; x2_0]);
[t_rkf23, x_rkf23, h_rkf23, d_rkf23] = RKF23(@trajectory_v2, t_span, [x1_0; x2_0], h0, hmin, eW, eB);

% Zależność estymaty błędu od czasu
figure;
plot(t_rkf23, d_rkf23);
title('Błąd estymaty od czasu d(t)');
xlabel('t');
ylabel('d');

% Zależność długości kroku od czasu
figure;
plot(t_rkf23, h_rkf23);
title('Długość kroku od czasu h(t)');
xlabel('t');
ylabel('h');

% Trajektoria na płaszczyźnie (x_1, x_2)
figure;
tiledlayout(1, 2);
nexttile
plot(x_ode45(:, 1), x_ode45(:, 2));
title('Trajektoria (x_1, x_2) - ode45');
xlabel('x_1');
ylabel('x_2');
nexttile
plot(x_rkf23(:, 1), x_rkf23(:, 2));
title('Trajektoria (x_1, x_2) - rkf23');
xlabel('x_1');
ylabel('x_2');

% Trajektoria x_2(t)
figure;
tiledlayout(1, 2);
nexttile
plot(t_ode45, x_ode45(:, 2));
title('Trajektoria x_2(t) - ode45');
xlabel('t');
ylabel('x_2(t)');
nexttile
plot(t_rkf23, x_rkf23(:, 2));
title('Trajektoria x_2(t) - rkf23');
xlabel('t');
ylabel('x_2(t)');

% Trajektoria x_1(t)
figure;
tiledlayout(1, 2);
nexttile
plot(t_ode45, x_ode45(:, 1));
title('Trajektoria x_1(t) - ode45');
xlabel('t');
ylabel('x_1(t)');
nexttile
plot(t_rkf23, x_rkf23(:, 1));
title('Trajektoria x_1(t) - rkf23');
xlabel('t');
ylabel('x_1(t)');
