function Point = ellipticCurveAdd(x_p, y_p, x_q, y_q, a, b, p)
    % Elliptic curve point addition
    if (x_p == 0 && y_p == 0)
        Point = [x_q, y_q];
        return;
    end
    if (x_q == 0 && y_q == 0)
        Point = [x_p, y_p];
        return;
    end
    if (x_p == x_q && y_p == y_q)
        Point = ellipticCurveAddSame(x_p, y_p, a, b, p);
        return;
    end
    if (x_p == x_q)
        Point = [0, 0]; % Point at infinity
        return;
    end

    lambda = mod((y_q - y_p) * modInverse(x_q - x_p, p), p);
    x_r = mod(lambda^2 - x_p - x_q, p);
    y_r = mod(lambda * (x_p - x_r) - y_p, p);

    Point = [x_r, y_r];
end

