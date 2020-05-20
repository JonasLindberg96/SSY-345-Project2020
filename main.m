%% Test streaming
[xhat, meas] = filterTemplate();

%% Plot some data
subplot(1,2,1)
hold on
plot(meas.t, meas.gyr(1,:))
plot(meas.t, meas.gyr(2,:))
plot(meas.t, meas.gyr(3,:))
title('Gyro')
xlabel('Time')
ylabel('Reading')
legend('X','Y','Z')

subplot(1,2,2)
hold on
plot(meas.t, meas.acc(1,:))
plot(meas.t, meas.acc(2,:))
plot(meas.t, meas.acc(3,:))
title('Acceleremeter')
xlabel('Time')
ylabel('Reading')
legend('X','Y','Z')
