%Property of MATHWORKS (MATLAB)

function isValid = isSignatureValid(Modulus, PublicExponent, encryptedMessage, signature)
    % Decrypt the signature using the public key
    decryptedSignature = Decrypt(Modulus, PublicExponent, signature);

    % Check if the decrypted signature matches the original message
    if isequal(decryptedSignature, encryptedMessage)
        isValid = true;
    else
        isValid = false;
    end
end