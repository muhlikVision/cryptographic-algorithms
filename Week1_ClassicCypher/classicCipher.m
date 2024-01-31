function f = classicCipher(type, shift, len ,user_text)
    % This function implements a classic cipher for text encryption and decryption.

    text = '';  % Initialize as an empty character array

    for i = 1:len  % Loop over each character in the user_text
        ch = user_text(i);  % Get the i-th character

        ascii = unicode2native(ch);  % Convert the character to its ASCII value
    
        if (ch >= 'a' && ch <= 'z')  % Check if the character is a lowercase letter
            if(type == 0)  % Check if the operation is encryption
                ascii = ascii + shift;  % Shift the ASCII value for encryption
            else  % If the operation is not encryption, then it's decryption
                ascii = ascii - shift;  % Shift the ASCII value for decryption
            end
                
            % Wrap around the ASCII value if it's out of the lowercase letters range
            if ascii > uint8('z')
                ascii = ascii - 26;
            elseif ascii < uint8('a')
                ascii = ascii + 26;
            end
        
            % Add the shifted character to the text
            text = [text, char(ascii)];  % Use square brackets to concatenate characters
                
        else  % If the character is not a lowercase letter
            % Add the character to the text without shifting
            text = [text, char(ascii)];  % Use square brackets to concatenate characters
        end
    end

    % Display the result
    if(type == 0)
        disp('Encrypted: ');  % If the operation was encryption
    else
        disp('Decrypted: ');  % If the operation was decryption
    end

    disp(text);  % Display the resulting text
    f = text;  % Return the resulting text
end
