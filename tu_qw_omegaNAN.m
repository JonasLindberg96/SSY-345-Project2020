function [x, P] = tu_qw_omegaNAN(x, P)
% tu_qw implements the time update function.
% Inputs:
% x - States quaternion
% P - 
% omega - Measured angular rate
% T - Time since the last measurement
% Rw - Process noise covariance
%
% Outputs
% x - States quaternion
% P - Covarance

% If no measured angle rate, use random walk
x = x;
P = P + eye(size(x,1)) * 0.001;
end