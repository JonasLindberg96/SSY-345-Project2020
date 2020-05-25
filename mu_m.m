function [x, P] = mu_m(x, P, mag, m0, Rm)
    
    y = mag;
    R = Rm;
    
    % We need hx and Hx (jacobian)
    hx = Qq(x)' * m0;
    
    [Q0, Q1, Q2, Q3] = dQqdq(x);
    Hx = [Q0'* m0, Q1'* m0, Q2'* m0, Q3'* m0];
    
    % EKF Update step from HA3

    S = Hx * P * Hx' + R;
    K = P * Hx' / S;

    x = x + K * (y - hx);
    P = P - K * S * K';
end