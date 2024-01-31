function f = OneTimePad(type, len ,user_text, seq, dseq)
    % This function implements a simple version of the One-Time Pad encryption and decryption method.
    % 'type' is a boolean where 0 stands for encryption and 1 stands for decryption.
    % 'len' is the length of the user's text.
    % 'user_text' is the text input by the user for encryption or decryption.
    % 'seq' and 'dseq' are data structures used for the encryption and decryption process.

    text = '';  % Initialize 'text' as an empty character array. This will store the final encrypted/decrypted text.

    if(type == 1)  % If type is 1 (decryption), then pop elements from 'dseq' and push them into 'seq'.
        for j = 1:dseq.size
            seq.push(dseq.pop());
        end
    end

    for i = 1:len  % Loop over each character in the user's text.
        ch = user_text(i);  % Get the i-th character from the user's text.
        ascii = unicode2native(ch);  % Convert the character to its ASCII value.

        if (ch >= 'a' && ch <= 'z')  % Check if the character is a lowercase letter.

            if(type == 0)  % If type is 0 (encryption), then pop an element from 'seq', push it into 'dseq', and add its value to the ASCII value of the character.
                n = seq.pop();
                dseq.push(n);
                ascii = ascii + n;
            elseif (type == 1)  % If type is 1 (decryption), then pop an element from 'seq' and subtract its value from the ASCII value of the character.
                n2 = seq.pop();
                ascii = ascii - n2;
            end

            % If the new ASCII value is outside the range of lowercase letters, wrap it around to stay within the range.
            if ascii > uint8('z')
                ascii = ascii - 26;
            elseif ascii < uint8('a')
                ascii = ascii + 26;
            end

            text = [text, char(ascii)];  % Add the new character to the 'text' array.
        else
            text = [text, char(ascii)];  % If the character is not a lowercase letter, add it to the 'text' array as is.
        end
    end

    % Display the final encrypted or decrypted text.
    if(type == 0)
        disp('Encrypted: ');
    else
        disp('Decrypted: ');
    end

    disp(text);
    f = text;  % Return the final encrypted or decrypted text.
end
