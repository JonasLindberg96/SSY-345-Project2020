%% Startup

run startup.m
%% Task 2
% Test streaming
%[xhat, meas] = filterTemplate();


%% Mean and covariance
% Remove NaN values before calculating mean and cov

gyr = meas.gyr(:,~isnan(meas.gyr(1,:)))';
acc = meas.acc(:,~isnan(meas.acc(1,:)))';
mag = meas.mag(:,~isnan(meas.mag(1,:)))';

mean_gyr = mean(gyr);
mean_acc = mean(acc);
mean_mag = mean(mag);

cov_gyr = cov(gyr);
cov_acc = cov(acc);
cov_mag = cov(mag);

%% Histograms
% Normal distributions:

t = meas.t(1:3500);
% Gyroscope
subplot(3,3,1)
sgtitle('Histograms','FontSize',24)
histogram(meas.gyr(1,1:length(t)))
title('Gyro X','FontSize',16)
xlabel('$rad/s$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,4)
histogram(meas.gyr(2,1:length(t)))
title('Gyro Y','FontSize',16)
xlabel('$rad/s$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,7)
histogram(meas.gyr(3,1:length(t)))
title('Gyro Z','FontSize',16)
xlabel('$rad/s$','FontSize',18, 'Interpreter', 'latex')

% Accelerometer
subplot(3,3,2)
histogram(meas.acc(1,1:length(t)))
title('Acc X','FontSize',16)
xlabel('$m/s^2$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,5)
histogram(meas.acc(2,1:length(t)))
title('Acc Y','FontSize',16)
xlabel('$m/s^2$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,8)
histogram(meas.acc(3,1:length(t)))
title('Acc Z','FontSize',16)
xlabel('$m/s^2$','FontSize',18, 'Interpreter', 'latex')

% Magnetometer
subplot(3,3,3)
histogram(meas.mag(1,1:length(t)))
title('Magnetometer X','FontSize',16)
xlabel('$\mu T$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,6)
histogram(meas.mag(2,1:length(t)))
title('Magnetometer Y','FontSize',16)
xlabel('$\mu T$','FontSize',18, 'Interpreter', 'latex')
subplot(3,3,9)
histogram(meas.mag(3,1:length(t)))
title('Magnetometer Z','FontSize',16)
xlabel('$\mu T$','FontSize',18, 'Interpreter', 'latex')

%% Plot some data
t = meas.t(1:3500);
subplot(3,1,1)
sgtitle('Phone lying flat on table','FontSize',22)
hold on
plot(t, meas.gyr(1,1:length(t)))
plot(t, meas.gyr(2,1:length(t)))
plot(t, meas.gyr(3,1:length(t)))
title('Gyro','FontSize',16)
xlabel('Time (s)','FontSize',14)
ylabel('$rad/s$','FontSize',18, 'Interpreter', 'latex')
legend('X','Y','Z','FontSize',14)

subplot(3,1,2)
hold on
plot(t, meas.acc(1,1:length(t)))
plot(t, meas.acc(2,1:length(t)))
plot(t, meas.acc(3,1:length(t)))
title('Acceleremeter','FontSize',16)
xlabel('Time (s)','FontSize',14)
ylabel('$m/s^2$','FontSize',18, 'Interpreter', 'latex')
legend('X','Y','Z','FontSize',14)

subplot(3,1,3)
hold on
plot(t, meas.mag(1,1:length(t)))
plot(t, meas.mag(2,1:length(t)))
plot(t, meas.mag(3,1:length(t)))
title('Magnetometer','FontSize',16)
xlabel('Time (s)','FontSize',14)
ylabel('$\mu T$','FontSize',18, 'Interpreter', 'latex')
legend('X','Y','Z','FontSize',14)
