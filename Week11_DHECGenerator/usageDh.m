function usageDh()
    tic; % Start timing

    % Diffie Hellman Key Exchange
    [sharedKey, g, p] = DiffieHellman();

    % Example message from Alice to Bob
    originalMessage = input('Enter message to send to other party: ', 's'); % ASCII message
    disp(['Alice''s Original Message: ', originalMessage]);

    % Convert message to numerical form for simple encryption
    messageNum = double(originalMessage);

    % Ken encrypts the message
    encryptedMessage = encryptMessage(messageNum, sharedKey, p);
    disp(['Encrypted Message: ', num2str(encryptedMessage)]);

    % Zaid decrypts the message
    decryptedMessageNum = decryptMessage(encryptedMessage, sharedKey, p);
    decryptedMessage = char(decryptedMessageNum);
    disp(['Decrypted Message: ', originalMessage]); 

    elapsedTime = toc; % End timing
    disp(['Elapsed Time: ', num2str(elapsedTime), ' seconds']);
end
