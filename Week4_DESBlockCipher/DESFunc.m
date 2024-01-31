function DESFunc(text, mode)
% DESFunc is a function that performs encryption and decryption using DES algorithm.
% The function takes two inputs: 'text' and 'mode'.
% 'text' is the input text to be encrypted or decrypted.
% 'mode' is a flag that determines whether to encrypt (0) or decrypt (1).
tic; % Start timer to measure the execution time of the function.

if mode == 0 % If mode is 0, perform encryption.
    key = keygen; % Generate a key for encryption.
    class(key); % Display the class of the key.
    
    fileName = text; % The input text is treated as a filename.

    % Open the file and read its contents.
    fileID = fopen("Week4_DESBlockCipher\\"+fileName,'r');
    if fileID == -1
        error('File not found'); % If the file is not found, throw an error.
    end
    user_text = fscanf(fileID, '%c'); % Read the contents of the file.
    fclose(fileID); % Close the file after reading.
    disp(user_text);
    % Convert the text to base64 binary.
    base64Encrypt = matlab.net.base64encode(user_text);
    disp('Text converted to base64 binary: ');
    disp(base64Encrypt);
    
    % Encrypt the base64 binary text using DES algorithm.
    try
        enc_text = DES(base64Encrypt, key, 'ENC');
    catch e
        disp(e.message);
    end
    disp('Encrypted Text: ');
    disp(enc_text);
    disp('Key: ');
    disp(key);

    % Write the encrypted text to a file.
    fileID = fopen('Week4_DESBlockCipher\\data_encrypted.txt','w');
    if fileID == -1
        error('Cannot open file for writing'); % If the file cannot be opened for writing, throw an error.
    end
    fprintf(fileID, '%s', enc_text); % Write the encrypted text to the file.
    fclose(fileID); % Close the file after writing.
    
    % Write the key to a file.
    writematrix(key,'Week4_DESBlockCipher\\data_key.txt', 'delimiter', '\t');
    

elseif mode == 1 % If mode is 1, perform decryption.
    fileName = text; % The input text is treated as a filename.

    % Open the file and read its contents.
    fileID = fopen("Week4_DESBlockCipher\\"+fileName,'r');
    if fileID == -1
        error('File not found'); % If the file is not found, throw an error.
    end
    user_text = fscanf(fileID, '%c'); % Read the contents of the file.
    fclose(fileID); % Close the file after reading.
     
    % Read the key from a file.
    key = readmatrix('Week4_DESBlockCipher\\data_key.txt');
    
    % Decrypt the text using DES algorithm.
    disp('Decrypted Text (base64 binary): ');
    decrypted = DES(user_text, key, 'DEC');
    disp('Decrypted Text (base64 binary): ');
    disp(decrypted);

    % Convert the base64 binary to text.
    n = matlab.net.base64decode(decrypted);
    disp('Decrypted Text: ');
    disp(char(n));

    % Write the decrypted text to a file.
    fileID = fopen('Week4_DESBlockCipher\\data_decrypted.txt','w');
    if fileID == -1
        error('Cannot open file for writing'); % If the file cannot be opened for writing, throw an error.
    end
    fprintf(fileID, '%s', n); % Write the decrypted text to the file.
    fclose(fileID); % Close the file after writing.
end

toc; % Stop the timer and display the execution time of the function.
end
