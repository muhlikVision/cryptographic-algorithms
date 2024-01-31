function inv = modInverse(a, m)
    % Modular inverse
    [g, x, ~] = gcd(a, m);
    if g ~= 1
        error('modInverse does not exist');
    else
        inv = mod(x, m);
    end
end
