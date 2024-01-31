function  HashFunc(fileName)
tic;
    % Open the file with the given filename
    fileID = fopen(fileName,'r');
        % If the file does not exist, throw an error
        if fileID == -1
            error('File not found');
        end
        % Read the entire file into a character array
        user_text = fscanf(fileID, '%c');
        % Close the file
        fclose(fileID);

    % Define the available hashing methods
    hashType = {'SHA-1', 'SHA-256', 'SHA-384', 'SHA-512', 'MD2', 'MD5'};
    % Display a menu for the user to select a hashing method
    m = menu('Select a hashing method:', hashType);
    % Store the selected hashing method
    hashMethod = hashType{m};
    
    % Define the available output types
    out = {'hex', 'double', 'uint8', 'base64', 'short'};
    % Display a menu for the user to select an output type
    o = menu('Select an output type:', out);
    % Store the selected output type
    selectedOutputType = out{o};
    
    % Perform the DataHash operation with the selected inputs
    res = DataHash(user_text, selectedOutputType, hashMethod);

    % Display the hash result
    fprintf('Hash Result: %s\n', res);
    
    % Open a new file to save the hash result
    fileID = fopen('Week6_Hash\\data_hash.txt', 'w');

    % Adjust the storage format based on the selected output type
    switch lower(selectedOutputType)
        case {'hex', 'base64', 'short'}
            % If the output type is a string, write the result as a string
            fprintf(fileID, '%s', res);
        case 'double'
            % If the output type is a double, write the result as a floating-point number
            fprintf(fileID, '%f', res);
        case 'uint8'
            % If the output type is uint8, write the result as an integer
            fprintf(fileID, '%d', res);
        otherwise
            % If the output type is not supported, throw an error
            error('Unsupported output type');
    end

    % Close the file
    fclose(fileID);
toc;
end
