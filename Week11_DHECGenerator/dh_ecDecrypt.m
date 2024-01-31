function dh_ecDecrypt()
    tic;
    % Read the encrypted message from the file
    encryptedFilename = 'data_encrypted.txt';
    encryptedFileID = fopen(encryptedFilename, 'r');
    encryptedMessage = fscanf(encryptedFileID, '%d');
    fclose(encryptedFileID);

    % Read the shared key from the file
    keyFilename = 'SharedKey.txt';
    keyFileID = fopen(keyFilename, 'r');
    sharedKey = fscanf(keyFileID, '%d');
    fclose(keyFileID);
    
    disp(encryptedMessage);
    disp(sharedKey);

    % Bob decrypts the message using the shared key
    % (Decryption process is the same as encryption in this simple case)
    decryptedMessageNum = eccEncryptDecrypt((encryptedMessage), sharedKey);
    
    % Convert the decrypted message numbers to characters
    decryptedMessage = char(decryptedMessageNum);
    
    % Display the decrypted message
    fprintf('Decrypted Message: %s\n', decryptedMessage);

    toc;
end
