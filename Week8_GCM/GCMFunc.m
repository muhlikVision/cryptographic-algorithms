function GCMFunc(fileName, mode)
% This function performs encryption and decryption based on the mode provided.
% fileName: The name of the file to be encrypted or decrypted.
% mode: The operation mode. 0 for encryption, 1 for decryption.

tic; % Start timer to measure the execution time of the function.

if mode == 0
    % Encryption mode.
    AAG='Additional Authenticator Tag'; % Additional Authenticator Tag for encryption.

    % Read the key, plain text input, and initialization vector (iv) from files.
    keyF = fopen('key.txt', 'r');
    key = fscanf(keyF,'%s');
    textF = fopen(fileName, 'r');
    plainTextInput = fscanf(textF,'%c');
    ivF = fopen('iv.txt', 'r');
    iv = fscanf(ivF,'%s');
    
    % Close the opened files.
    fclose(keyF);
    fclose(textF);
    fclose(ivF);

    % Convert the plain text input to Base64 binary.
    n = matlab.net.base64encode(plainTextInput);
    disp('Converted Base64 binary: ');
    disp(n);

    % Perform the encryption using the GCM_AE function.
    [cipher,tag] = GCM_AE(key,iv,n,AAG);
    
    disp('Encrypted: ');
    disp(cipher);
    disp('Tag: ');
    disp(tag);
    
    % Write the encrypted data and tag to files.
    fid = fopen('Week8_GCM\\data_encrypted.txt', 'w');
    fprintf(fid, '%c', cipher);
    fclose(fid);
    fid = fopen('Week8_GCM\\tag.txt', 'w');
    fprintf(fid, '%c', tag);
    fclose(fid);

elseif mode == 1
    % Decryption mode.
    AAG='Additional Authenticator Tag'; % Additional Authenticator Tag for decryption.

    % Read the key, cipher text, initialization vector (iv), and tag from files.
    keyF = fopen('key.txt', 'r');
    key = fscanf(keyF,'%s');
    textF = fopen(fileName, 'r');
    CipherText = fscanf(textF,'%c');
    ivF = fopen('iv.txt', 'r');
    iv = fscanf(ivF,'%s');
    tagF = fopen('tag.txt','r');
    Tag = fscanf(tagF,'%s');
    fclose(keyF);
    fclose(textF);
    fclose(ivF);
    fclose(tagF);

    % Perform the decryption using the GCM_AD function.
    [cipher,tag] = GCM_AD(key,iv,CipherText,AAG,Tag);
    
    disp('Decrypted (base64 binary): ');
    disp(cipher);
    disp('Decrypted: ');

    % Convert the decrypted Base64 binary back to plain text.
    n = matlab.net.base64decode(cipher);
    
    disp(char(n));
    disp(tag);

    % Write the decrypted data to a file.
    fid = fopen('Week8_GCM\\data_decrypted.txt', 'w');
    fprintf(fid, '%c', n);
    fclose(fid);
else
    % If an invalid mode is provided, throw an error.
    error('Wrong mode');
end

toc; % Stop timer and display the elapsed time.
end
