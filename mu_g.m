function [x, P] = mu_g(x, P, yacc, Ra, g0)
    
    y = yacc;
    R = Ra;
    
    % We need hx and Hx (jacobian)
    hx = Qq(q)' * g0;
    
    [Q0, Q1, Q2, Q3] = dQqdq(q);
    Hx = [Q0', Q1', Q2', Q3'] .* g0;
    
    % EKF Update step from HA3

    S = Hx * P * Hx' + R;
    K = P * Hx' / S;

    x = x + K * (y - hx);
    P = P - K * S * K';
end