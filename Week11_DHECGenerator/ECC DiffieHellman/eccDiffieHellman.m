function [sharedKeyA, sharedKeyB] = eccDiffieHellman()
    % Define Elliptic Curve Parameters (using small, simple values)
    a = -1; % Coefficient a of the curve equation
    b = 1; % Coefficient b of the curve equation
    p = 23; % A prime number defining the field F_p
    G = [5, 1]; % Generator point (G_x, G_y) on the curve

    % Ken's Private and Public Keys
    nAlice = randi([1, p-1]);
    PAlice = ellipticCurveMultiply(G, nAlice, a, b, p);

    % Zaid's Private and Public Keys
    nBob = randi([1, p-1]);
    PBob = ellipticCurveMultiply(G, nBob, a, b, p);

    % Generating Shared Keys
    sharedKeyA = ellipticCurveMultiply(PBob, nAlice, a, b, p); 
    sharedKeyB = ellipticCurveMultiply(PAlice, nBob, a, b, p); 

    % Displaying the Keys
    disp(['First''s generated Shared Key is : ', num2str(sharedKeyA)]);
    disp(['Second''s generated Shared Key is : ', num2str(sharedKeyB)]);
end