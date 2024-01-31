function classicCipherFunc(fileName, mode, inputType)
    % This function implements a classic cipher for text encryption and decryption.
    % It takes three inputs: fileName (the name of the file or the text to be encrypted or decrypted), 
    % mode (0 for encryption, 1 for decryption), and inputType (0 for text input, 1 for file input).

    global user_text;  % Declare user_text as a global variable
    shift = 3;  % Set the shift value for the cipher
    tic;
    if inputType == 0  % Check if the input is text
        if mode == 0  % Check if the operation is encryption
            user_text = fileName;  % Set the text to be encrypted
            user_text = lower(user_text);  % Convert the text to lowercase
            len = length(user_text);  % Get the length of the text
    
            encrypted_text = classicCipher(0,shift,len,user_text);  % Encrypt the text
        elseif mode == 1  % Check if the operation is decryption
            user_text = fileName;  % Set the text to be decrypted
            user_text = lower(user_text);  % Convert the text to lowercase
        
            len = length(user_text);  % Get the length of the text
            decrypted_text = classicCipher(1,shift,len,user_text);  % Decrypt the text
        else  % If the mode is neither 0 nor 1
            error('Wrong input for Encrypt/Decrypt mode.');  % Display an error message
        end

    elseif inputType == 1  % Check if the input is a file

        if mode == 0  % Check if the operation is encryption
            fileID = fopen(fileName,'r');  % Open the file for reading
            if fileID == -1  % Check if the file was opened successfully
                error('File not found');  % Display an error message if the file was not found
            end
            user_text = fscanf(fileID, '%c');  % Read the contents of the file
            fclose(fileID);  % Close the file
            user_text = lower(user_text);  % Convert the text to lowercase
            len = length(user_text);  % Get the length of the text
    
            encrypted_text = classicCipher(0,shift,len,user_text);  % Encrypt the text
    
            fileID = fopen('Week1_ClassicCypher\\data_encrypted.txt','w');  % Open a file for writing the encrypted text
            if fileID == -1  % Check if the file was opened successfully
                error('Cannot open file for writing');  % Display an error message if the file could not be opened
            end
            fprintf(fileID, '%s', encrypted_text);  % Write the encrypted text to the file
            fclose(fileID);  % Close the file

        elseif mode == 1  % Check if the operation is decryption
            fileID = fopen(fileName,'r');  % Open the file for reading
            if fileID == -1  % Check if the file was opened successfully
                error('File not found');  % Display an error message if the file was not found
            end
            user_text = fscanf(fileID, '%c');  % Read the contents of the file
            fclose(fileID);  % Close the file
            user_text = lower(user_text);  % Convert the text to lowercase
        
            len = length(user_text);  % Get the length of the text
            decrypted_text = classicCipher(1,shift,len,user_text);  % Decrypt the text
        
            fileID = fopen('Week1_ClassicCypher\\data_decrypted.txt','w');  % Open a file for writing the decrypted text
            if fileID == -1  % Check if the file was opened successfully
                error('Cannot open file for writing');  % Display an error message if the file could not be opened
            end
            fprintf(fileID, '%s', decrypted_text);  % Write the decrypted text to the file
            fclose(fileID);  % Close the file
        else  % If the mode is neither 0 nor 1
            error('Wrong input for Encrypt/Decrypt mode.');  % Display an error message
        end
    else  % If the inputType is neither 0 nor 1
        error('Wrong Input Type entered.');  % Display an error message
    end
    toc;
end
