function OneTimePadFunc(text, mode, inputType)
% This function implements a simple version of the One-Time Pad encryption and decryption method.
% 'text' is the input text or the name of the input file.
% 'mode' is a boolean where 0 stands for encryption and 1 stands for decryption.
% 'inputType' is a boolean where 1 stands for file input and 0 stands for direct text input.
tic;
if mode == 0  % If mode is 0 (encryption)
    if inputType == 1  % If inputType is 1 (file input)
        fileName = text;  % The input text is the name of the input file.

        % Open the input file and read its contents.
        fileID = fopen(fileName,'r');
        if fileID == -1
            error('File not found');
        end
        user_text = fscanf(fileID, '%c');
        fclose(fileID);

        user_text = lower(user_text);  % Convert the input text to lowercase.
        
        % Initialize the global variables.
        global len;
        len = length(user_text);
        
        global seq;seq = java.util.Stack();
        global temp;temp = java.util.Stack();
        global dseq;dseq = java.util.Stack();
        
        % Generate a random sequence of numbers between 0 and 25.
        rng('shuffle');
        random = floor((25-1).*rand(len,1));
        
        % Push the random numbers into the 'seq' and 'temp' stacks.
        for r = 1:len
            seq.push(random(r));
            temp.push(random(r));
        end
        
        % Display the random one-time pad.
        disp('Random one time pad: ');
        disp(temp);

        encrypt = 0;  % Set the encryption flag.
        
        % Write the random one-time pad to a file.
        try
            fileID = fopen('Week2_OneTimePad\\data_key.txt', 'w');
            for r = 1:len
                fprintf(fileID, '%d\n', temp.pop());
            end
            fclose(fileID);
        catch ME
            disp(ME);
        end

        % Encrypt the input text.
        encrypted_text = OneTimePad(encrypt,len,user_text, seq, dseq);

        % Write the encrypted text to a file.
        fileID = fopen('Week2_OneTimePad\\data_encrypted.txt','w');
        if fileID == -1
            error('Cannot open file for writing');
        end
        fprintf(fileID, '%s', encrypted_text);
        fclose(fileID);
        
    else
        error('Wrong Input Type');
    end
elseif mode == 1  % If mode is 1 (decryption)
    if inputType == 1  % If inputType is 1 (file input)
        fileName = text;  % The input text is the name of the input file.

        % Open the input file and read its contents.

        fileID = fopen("Week2_OneTimePad\\"+fileName,'r');
        if fileID == -1
            error('File not found');
        end
        user_text = fscanf(fileID, '%c');
        fclose(fileID);

        % Initialize the global variables.
        global len;
        len = length(user_text);
        disp(user_text);
        global seq;seq = java.util.Stack();
        global temp;temp = java.util.Stack();
        global dseq;dseq = java.util.Stack();

        % Open the file containing the random one-time pad and read its contents.
        fid = fopen('data_key.txt', 'r');
        if fid == -1
            error('File not found');
        end
        
        while ~feof(fid)
            line = fgets(fid);
            num = str2double(line);
            dseq.push(num);
        end
        fclose(fid);
        
        disp(dseq);
        
        %user_text = lower(user_text);  % Convert the input text to lowercase.
        
        decrypt = 1;  % Set the decryption flag.

        % Decrypt the input text.
        d = OneTimePad(1,len,user_text, seq, dseq);

        % Write the decrypted text to a file.
        fileID = fopen('Week2_OneTimePad\\data_decrypted.txt','w');
        if fileID == -1
            error('Cannot open file for writing');
        end
        fprintf(fileID, '%s', d);
        fclose(fileID);
        
    else
        error('Wrong Input Type');
    end
else
   error('Wrong mode');
end
toc;
end
