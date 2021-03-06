function [x, P] = tu_qw(x, P, omega, T, Rw)
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
% P - Covariance
    F = eye(size(x,1)) + 1/2 * Somega(omega) * T;
    G = 1/2 * Sq(x) * T;

    %Predicted mean
    x = F*x;
    % We update the covariance and the process noise covariance
    P = F*P*F' + G*Rw*G';
end