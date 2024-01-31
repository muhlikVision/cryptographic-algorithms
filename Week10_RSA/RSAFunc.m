function RSAFunc(fileName, mode)
% RSAFunc is a function that performs RSA encryption or decryption based on the mode.
% fileName: The name of the file to be encrypted or decrypted.
% mode: If 0, the function will perform encryption. If 1, it will perform decryption.
tic;
if mode == 0
    % Encryption mode

    % Open the file and read its contents
    fileID = fopen(fileName, 'r');
    message = fread(fileID, '*char')';
    fclose(fileID);

    % Display the original message
    disp(message);

    % Generate the key pair
    [Modulus, PublicExponent, PrivateExponent] = GenerateKeyPair;

    % Try to encrypt the message
    try
        encryptedMessage = Encrypt(Modulus, PublicExponent, int32(message));
    catch E
        % If there's an error during encryption, display the error message
        disp(E.message);
    end
    
    % Generate the signature
    signature = Sign(Modulus, PrivateExponent, encryptedMessage);
    
    % Display the encrypted message, signature, and keys
    disp('Encrypted: ');
    disp(encryptedMessage);
    disp('Signature: ');
    disp(signature);
    disp('Modulus: ');
    disp(Modulus);
    disp('PublicExponent: ');
    disp(PublicExponent);
    disp('PrivateExponent: ');
    disp(PrivateExponent);

    % Write the keys, encrypted message, and signature to files
    fileID = fopen('Week10_RSA\\Modulus.txt','w');
    fprintf(fileID, '%d\n', Modulus);
    fclose(fileID);
    fileID = fopen('Week10_RSA\\PublicExponent.txt','w');
    fprintf(fileID, '%d\n', PublicExponent);
    fclose(fileID);
    fileID = fopen('Week10_RSA\\PrivateExponent.txt','w');
    fprintf(fileID, '%d\n', PrivateExponent);
    fclose(fileID);
    fileID = fopen('Week10_RSA\\data_encrypted.txt','w');
    fprintf(fileID, '%d\n', encryptedMessage);
    fclose(fileID);
    fileID = fopen('Week10_RSA\\signature.txt','w');
    fprintf(fileID, '%d\n', signature);
    fclose(fileID);

elseif mode == 1
    % Decryption mode

    % Try to load the encrypted message and keys from files
    try
        encryptedMessage = load(fileName);
        PublicExponent = load('PublicExponent.txt');
        PrivateExponent = load('PrivateExponent.txt');
        signature = load('signature.txt');
        Modulus = load('Modulus.txt');
    catch e
        % If there's an error during loading, display the error message
        disp(e);
    end

    % Display the loaded encrypted message and keys
    disp('Encrypted Message: ')
    fprintf('%d ',encryptedMessage);
    disp(' ');
    disp('PublicExponent: ')
    fprintf('%d ',PublicExponent);
    disp(' ');
    disp('PrivateExponent: ')
    fprintf('%d ',PrivateExponent);
    disp(' ');
    disp('Modulus: ')
    fprintf('%d ',Modulus);
    disp(' ');
    disp('Signature: ')
    fprintf('%d ',signature);
    disp(' ');

    % Try to decrypt the message
    try
        decryptedMessage = Decrypt(Modulus, PrivateExponent, encryptedMessage);
    catch E
        % If there's an error during decryption, display the error message
        disp(E);
    end
    
    % Display the decrypted message
    disp('Decrypted: ');
    fprintf('%s',decryptedMessage);disp(' ');

    % Verify the signature
    if isSignatureValid(Modulus, PublicExponent, encryptedMessage, signature)
        disp('Signature valid.');
    else
        disp('Signature not valid.');
    end
    
    % Write the decrypted message to a file
    fileID = fopen('Week10_RSA\\decryptedMessage.txt','w');
    if fileID == -1
        error('Cannot open file for writing');
    end
    fprintf(fileID, '%s', decryptedMessage);
    fclose(fileID);
end
toc;
end
