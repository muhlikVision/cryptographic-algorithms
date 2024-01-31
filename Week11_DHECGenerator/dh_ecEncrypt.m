function dh_ecEncrypt()
    tic; % Start timing

    % Perform Elliptic Curve Diffie-Hellman Key Exchange
    [sharedKeyA, sharedKeyB] = eccDiffieHellman();
    
    % Ensure that both parties have the same shared key
    if ~isequal(sharedKeyA, sharedKeyB)
        error('Shared keys are not equal. Key exchange failed.');
    end
    sharedKey = sharedKeyA; % Use either sharedKey_A or sharedKey_B

    % Example message from Alice to Bob
    originalMessage = input('Enter a string: ', 's'); % ASCII message

    % Convert message to numerical form for simple encryption
    % (Here we simply convert the characters to their ASCII values)
    messageNum = double(originalMessage);

    % Alice encrypts the message using the shared key
    encryptedMessage = eccEncryptDecrypt(messageNum, sharedKey);

    % Save the encrypted message to a file
    encryptedFilename = 'Week11_DHECGenerator\\data_encrypted.txt';
    encryptedFileID = fopen(encryptedFilename, 'w');
    fprintf(encryptedFileID, '%d ', encryptedMessage);
    fclose(encryptedFileID);

    keyFilename = 'Week11_DHECGenerator\\SharedKey.txt';
    keyFileID = fopen(keyFilename, 'w');
    fprintf(keyFileID, '%d ', (sharedKey));
    fclose(keyFileID);

    toc;
end