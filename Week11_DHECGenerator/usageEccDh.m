function usageEccDh()
    tic; % Start timing

    % Perform Elliptic Curve Diffie-Hellman Key Exchange
    [sharedKeyA, sharedKeyB] = eccDiffieHellman();

    % Ensure that both parties have the same shared key
    if ~isequal(sharedKeyA, sharedKeyB)
        error('Shared keys are not equal. Key exchange failed.');
    end
    sharedKey = sharedKeyA; % Use either sharedKey_A or sharedKey_B

    % Example message from Alice to Bob
    originalMessage = input('Enter a message to share: ', 's'); % ASCII message
    disp(['Alice''s Original Message: ', originalMessage]);

    % Convert message to numerical form for simple encryption
    % (Here we simply convert the characters to their ASCII values)
    messageNum = double(originalMessage);

    % Alice encrypts the message using the shared key
    encryptedMessage = eccEncryptDecrypt(messageNum, sharedKey);
    disp(['Encrypted Message: ', num2str(encryptedMessage)]);

    % Bob decrypts the message using the shared key
    % (Decryption process is same as encryption in this simple case)
    decryptedMessageNum = eccEncryptDecrypt(encryptedMessage, sharedKey);
    decryptedMessage = char(decryptedMessageNum);
    disp(['Decrypted Message: ', decryptedMessage]);

    elapsedTime = toc; % End timing
    disp(['Elapsed Time: ', num2str(elapsedTime), ' seconds']);
end