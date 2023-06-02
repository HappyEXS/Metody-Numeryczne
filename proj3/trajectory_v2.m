function dxdt = trajectory_v2(x)
    dx1dt = x(2) + x(1) * (0.6 - x(1)^2 - x(2)^2);
    dx2dt = -x(1) + x(2) * (0.6 - x(1)^2 - x(2)^2);

    dxdt = [dx1dt; dx2dt];
end