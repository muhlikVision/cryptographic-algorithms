function KeyHashFunc(fileName)
% This function generates a hash for a file using a key and a specified hashing method.
% The key is read from a file named 'key.txt'.
% The hashing method is input by the user at runtime.
% The generated hash is then written to a file named 'data_hash.txt'.

% Read the key from 'key.txt'
key = fileread('key.txt');

% Prompt the user to choose the hashing method
prompt = 'Choose the hashing method SHA-1 , SHA-256, SHA-384, SHA-512: ';
method = input(prompt, 's');

% Read the file data
A = fileread(fileName);
disp('File Data: ');
disp(A);

% Generate the hash using the key, file data, and chosen method
hash = HMAC(key,A,method);

% Open 'data_hash.txt' for writing
fileID = fopen('Week7_Keyedhash\\data_hash.txt','w');
        if fileID == -1
            error('Cannot open file for writing');
        end
        % Write the generated hash to 'data_hash.txt'
        fprintf(fileID, '%s', hash);
        fclose(fileID);

end
