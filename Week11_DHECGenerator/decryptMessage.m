function decryptedMessage = decryptMessage(encryptedMessage, key, p)
    % Expand the key to match the length of the encrypted message
    keyArray = repmat(key, 1, length(encryptedMessage));
    
    % Simple XOR decryption (same as encryption)
    decryptedMessage = mod(bitxor(encryptedMessage, keyArray), p);
end