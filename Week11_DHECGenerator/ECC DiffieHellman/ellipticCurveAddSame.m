function Point = ellipticCurveAddSame(x, y, a, b, p)
    % Elliptic curve point doubling
    if y == 0
        Point = [0, 0]; % Point at infinity
        return;
    end

    lambda = mod((3 * (x^2) + a) * modInverse(2 * y, p), p);
    x_r = mod(lambda^2 - 2 * x, p);
    y_r = mod(lambda * (x - x_r) - y, p);

    Point = [x_r, y_r];
end
