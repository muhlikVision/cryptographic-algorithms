function R = ellipticCurveMultiply(P, n, a, b, p)
    % Elliptic curve point multiplication
    R = [0, 0];
    Q = P;
    while n > 0
        if mod(n, 2) == 1
            R = ellipticCurveAdd(R(1), R(2), Q(1), Q(2), a, b, p);
        end
        Q = ellipticCurveAdd(Q(1), Q(2), Q(1), Q(2), a, b, p);
        n = floor(n / 2);
    end
end