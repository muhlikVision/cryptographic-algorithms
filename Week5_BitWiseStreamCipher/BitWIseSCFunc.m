function BitWIseSCFunc(text, mode)
% This function performs bitwise stream cipher encryption or decryption based on the mode.
% Input: text - the file name of the text to be encrypted or decrypted
%        mode - 0 for encryption, 1 for decryption

tic; % Start timer to measure the performance of the function

if mode == 0
    % Encryption mode
    fileName = text; % The name of the file to be encrypted

    % Read the plaintext from the file
    fileID = fopen(fileName,'r');
    if fileID == -1
        error('File not found');
    end
    plaintext = fscanf(fileID, '%c');
    fclose(fileID);

    % Read the key from the file
    fileID = fopen('input_key.txt','r');
    if fileID == -1
        error('File not found');
    end
    key = fscanf(fileID, '%c');
    fclose(fileID);

    % Convert the plaintext to base64 binary
    base64Encrypt = matlab.net.base64encode(plaintext);
    disp('Text converted to base64 binary: ');
    disp(base64Encrypt);

    % Generate the keystream using the KSA and PRGA algorithms
    Z = uint8(PRGA(KSA(key), size(base64Encrypt,2)));
    P = uint8(char(base64Encrypt));

    % Perform the encryption using bitwise XOR
    res = bitxor(Z, P);
    
    disp('Key: ');
    disp(char(Z));
    
    % Print the encrypted result in Unicode
    disp('Encrypted (UniCode): ');
    disp(res);

    % Convert the encrypted result to hexadecimal
    res_in_hex = mat2str(dec2hex(res,2));
    res_in_unicode = char(res);
    
    disp('Encrypted (Hex):');
    disp(res_in_unicode);
    
    % Write the encrypted data to a file
    fileID = fopen('Week5_BitWiseStreamCipher\\data_encrypted.txt','w');
    if fileID == -1
        error('Cannot open file for writing');
    end
    fprintf(fileID, '%d ', res);
    fclose(fileID);

    % Write the key to a file
    fileID = fopen('Week5_BitWiseStreamCipher\\data_key.txt','w');
    if fileID == -1
        error('Cannot open file for writing');
    end
    fprintf(fileID, '%d ', Z);
    fclose(fileID);
    
elseif mode == 1
    % Decryption mode
    fileName = text; % The name of the file to be decrypted

    % Read the encrypted data from the file
    fileID = fopen(fileName,'r');
    res = fscanf(fileID, '%d');
    fclose(fileID);

    % Read the key from the file
    fileID = fopen('data_key.txt','r');
    Z = fscanf(fileID, '%d');
    fclose(fileID);
    
    % Perform the decryption using bitwise XOR
    try
        result = bitxor((Z), (res));
    catch ME
        disp(ME);
    end

    % Convert the decrypted result to base64 binary
    disp('Decrypted (Unicode) in base64 binary: ');
    fprintf(char(result));
    disp(' ');

    % Decode the base64 binary to get the original text
    n = matlab.net.base64decode(char(result));

    disp('Decrypted Text: ');
    disp(char(n));

    % Write the decrypted text to a file
    fileID = fopen('Week5_BitWiseStreamCipher\\data_decrypted.txt','w');
    if fileID == -1
        error('Cannot open file for writing');
    end
    fprintf(fileID, '%s', n);
    fclose(fileID);
    
else
    % Invalid mode
    error('Wrong Mode');
end

toc; % Stop timer and display the elapsed time
end
