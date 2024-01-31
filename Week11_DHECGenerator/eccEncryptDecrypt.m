function result = eccEncryptDecrypt(data, key)
    % A simple XOR encryption/decryption function
    % This is for demonstration purposes and is not secure for real use

    % Assuming the key is an array (like a point), we use only the first element
    % If key is just a number, this still works fine
    keyVal = key(1);

    % Expand the key to match the length of the data
    keyArray = repmat(keyVal, 1, length(data));

    result = bitxor(data, keyArray);
end