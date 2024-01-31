clc
disp('1) Classic Cipher')
disp('2) One-way pad')
disp('3) Bit-wise XOR cipher')
disp('4) DES block cipher')
disp('5) Bit-wise stream cipher')
disp('6) Hash')
disp('7) Keyed Hash')
disp('8) Authenticated Encrypt (GCM)')
disp('9) Metrics/Stats function menu Option')
disp('10) RSA')
fprintf('11) DH/EC Key generator \n\n')

while true
    try
        disp(' ');
        user_input = input('Enter the Cipher Function number you would like to use: ');
        if user_input == 0
            disp('Program Stopped.');
            break;
        end
        mode = input('Enter 0 for encrypt, 1 for decrypt: ');
        inputType = input('Enter 0 for simple user plaintext input, 1 for .txt/image input: ');

        switch user_input
            case 1 %classic cipher
                switch inputType
                    case 0
                        raw_input = input('Enter plaintext: ', 's');
                        classicCipherFunc(raw_input, mode, inputType);
                        disp(' ');
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        classicCipherFunc(fileName, mode, inputType);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 2 %One Time Pad
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        OneTimePadFunc(fileName, mode, inputType);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 3 % Bit wise XOR
                switch inputType
                    case 0
                        raw_input = input('Enter plaintext: ', 's');
                        bitXorFunc(raw_input, mode, inputType);
                        disp(' ');
                    case 1
                        fileInputType = input('Enter 0 for txt file, 1 for img file: ');
                        if fileInputType == 0
                            fileName = input('Enter text file name: ', "s");
                            bitXorFunc(fileName, mode, 1); % txt file as an input
                            disp(' ');
                        elseif fileInputType == 1
                            fileName = input('Enter image file name: ', "s");
                            bitXorFunc(fileName, mode, 2); % img file as an input
                            disp(' ');
                        else
                            error('Wrong file type entered.');
                        end
                    otherwise
                        error('Wrong input entered');
                end
            case 4 %DES/AES
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        DESFunc(fileName, mode);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 5 %bitWise Steam Cipher
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        BitWIseSCFunc(fileName, mode);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 8 %GCM
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        GCMFunc(fileName, mode);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 6 %Hash
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        HashFunc(fileName);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 7 %Keyed Hash
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        KeyHashFunc(fileName);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 10 %RSA
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        RSAFunc(fileName, mode);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 9 %Metrics
                switch inputType
                    case 1
                        fileName = input('Enter text file name: ', "s");
                        MetricFUnc(fileName);
                        disp(' ');
                    otherwise
                        error('Wrong input entered');
                end
            case 11 %DiffieHellman
                switch mode
                    case 0
                        dh_ecEncrypt();
                    case 1
                        dh_ecDecrypt();
                    otherwise
                        error('Wrong mode');
                end
            case 0
                disp('Program Stopped.');
                break;
            otherwise
                error('Wrong input entered');
        end
    catch ME
        disp(ME.message);
    end
end
