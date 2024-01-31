function bitXorFunc(text,mode, inputType)

key = input('Give a key: ', 's');
tic;
switch inputType
    case 0
        if mode == 0
            
            plaintext = matlab.net.base64encode(text);
            fprintf('Text converted to base64 binary: ');
            disp(plaintext);

            plaintextLength = length(plaintext);
            keyLength = length(key);
            
            encryptedText = zeros(1, plaintextLength, 'uint8');
            
            for i = 1:plaintextLength
              encryptedText(i) = bitxor(uint8(plaintext(i)), uint8(key(mod(i-1, keyLength)+1)));
            end
            fprintf('Encrypted Text values (in ASCII codes): ');
            disp(encryptedText);

        elseif mode == 1
            
            encryptedText = text;

            plaintextLength = length(encryptedText);
            keyLength = length(key);

            decryptedText = char(zeros(1, keyLength));
            for i= 1:plaintextLength
              decryptedText(i) = char(bitxor(uint8(encryptedText(i)), uint8(key(mod(i-1, keyLength)+1))));
            end
            fprintf('Decrypted Text in base64 binary: ');
            disp(decryptedText);
            
            fprintf('Decrypted Text values (in ASCII codes): ');
            byteArray = matlab.net.base64decode(decryptedText);
            disp(byteArray);
        else
            error('Wrong mode');
        end
    case 1
        if mode == 0
            fileName = text;

            fileID = fopen(fileName,'r');
            if fileID == -1
                error('File not found');
            end
            user_text = fscanf(fileID, '%c');
            fclose(fileID);

            plaintext = matlab.net.base64encode(user_text);
            fprintf('Text file converted to base64 binary: ');
            disp(plaintext);

            plaintextLength = length(plaintext);
            keyLength = length(key);
            
            encryptedText = zeros(1, plaintextLength, 'uint8');
            
            for i = 1:plaintextLength
              encryptedText(i) = bitxor(uint8(plaintext(i)), uint8(key(mod(i-1, keyLength)+1)));
            end
            fprintf('Encrypted Text file values (in ASCII codes): ');
            disp(encryptedText);

            fileID = fopen('Week3_BitWIseXORCipher\\data_encrypted.txt','w');
            if fileID == -1
                error('Cannot open file for writing');
            end
            fprintf(fileID, '%s', encryptedText);
            fclose(fileID);

        elseif mode == 1
            fileName = text;

            fileID = fopen(fileName,'r');
            if fileID == -1
                error('File not found');
            end
            encryptedText = fscanf(fileID, '%c');
            fclose(fileID);

            plaintextLength = length(encryptedText);
            keyLength = length(key);

            decryptedText = char(zeros(1, keyLength));
            for i= 1:plaintextLength
              decryptedText(i) = char(bitxor(uint8(encryptedText(i)), uint8(key(mod(i-1, keyLength)+1))));
            end
            fprintf('Decrypted Text file in base64 binary: ');
            disp(decryptedText);
            
            fprintf('Decrypted Text file values: ');
            decrypted_plaintext = matlab.net.base64decode(decryptedText);
            disp(char(decrypted_plaintext));

            fileID = fopen('Week3_BitWIseXORCipher\\data_decrypted.txt','w');
            if fileID == -1
                error('Cannot open file for writing');
            end
            fprintf(fileID, '%s', decrypted_plaintext);
            fclose(fileID);

        else
            error('Wrong mode');
        end
    case 2
         if mode == 0
            img = imread(text);

            imgBytes = uint8(img);
            byteArray = imgBytes(:);
            
            plaintext = matlab.net.base64encode(byteArray);
            
            plaintextLength = length(plaintext);
            keyLength = length(key);
            
            fprintf('Image converted to base64 binary: ');
            disp(plaintext);

            encryptedText = zeros(1, plaintextLength, 'uint8');
            
            for i = 1:plaintextLength
              encryptedText(i) = bitxor(uint8(plaintext(i)), uint8(key(mod(i-1, keyLength)+1)));
            end
            fprintf('Encrypted Image values (in ASCII codes): ');
            disp(encryptedText);
            
            fileID = fopen('Week3_BitWIseXORCipher\\image_encrypted.txt','w');
            if fileID == -1
                error('Cannot open file for writing');
            end
            fwrite(fileID, encryptedText, 'uint8');
            fclose(fileID);

            disp(size(img));
            dims = size(img);
            fileID = fopen('Week3_BitWIseXORCipher\\image_size.txt','w');

            % Write the dimensions to the file
            fprintf(fileID, '%d %d %d\n', dims(1), dims(2), dims(3)); %changed
            fclose(fileID);

         elseif mode == 1

            fileID = fopen(text,'r');
            size1 = fopen('image_size.txt','r');
            if fileID == -1 || size1 == -1
                error('File not found');
            end

            encryptedText = fread(fileID, 'uint8');
            fclose(fileID);
            imageSize = fscanf(size1, '%d %d %d', [1 3]);
            fclose(size1);
            
            plaintextLength = length(encryptedText);
            keyLength = length(key);

            decryptedText = char(zeros(1, keyLength));
            for i= 1:plaintextLength
              decryptedText(i) = char(bitxor(uint8(encryptedText(i)), uint8(key(mod(i-1, keyLength)+1))));
            end
            fprintf('Decrypted Image in base64 binary: \n');
            disp(decryptedText);
            
            %fprintf('Decrypted Image values (in ASCII codes): ');
            byteArray = matlab.net.base64decode(decryptedText);
            %disp(byteArray);
            % disp(imageSize(1));
            % disp(imageSize(2));
            % disp(imageSize(3));

            % Convert the byte array to an image
            try 
                imgBytes = reshape(byteArray, [imageSize(1), imageSize(2), imageSize(3)]);
                img = uint8(imgBytes);
            catch ME
                disp(ME);
            end
            
            % Display the image
            imshow(img);
         else
            disp('Wrong mode');
         end
    otherwise
        error('Wrong input.');
end

toc;
end
