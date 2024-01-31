% This function takes a file path as input and performs various operations on the matrix data in the file.
function MetricFUnc(filepath)
    % Load the matrix data from the file at the given filepath.
    inputMatrix = load(filepath);
    
    % Calculate the total number of elements in the input matrix.
    matrixSize = numel(inputMatrix);
    % Display the size of the input matrix.
    fprintf('Input Matrix Size: %d elements\n', matrixSize);

    % Start a stopwatch timer.
    tic;
    % Compute the sum of all elements in the input matrix.
    result1 = computeSum(inputMatrix);
    % Read the elapsed time from the stopwatch timer.
    elapsedTime1 = toc;
    % Display the result and the elapsed time.
    fprintf('\nUsing tic and toc:\nResult = %f\nElapsed Time = %f seconds\n', result1, elapsedTime1);

    % Measure the time required to compute the sum of all elements in the input matrix using the timeit function.
    result2 = timeit(@() computeSum(inputMatrix));
    % Display the result.
    fprintf('\nUsing timeit:\nResult = %f\n', result2);

    % Start the profiler.
    profile on;
    % Compute the sum of all elements in the input matrix.
    result3 = computeSum(inputMatrix);
    % Stop the profiler.
    profile off; 
    % Display the result.
    fprintf('\nUsing profile on and profile viewer:\nResult = %f\n', result3);

    % Get information about the variable 'inputMatrix'.
    memoryUsage = whos('inputMatrix');
    % Display the memory usage of the 'inputMatrix' variable.
    fprintf('\nMemory Usage: %f MB\n', memoryUsage.bytes / (1024 * 1024));
end

% This function computes the sum of all elements in a given matrix.
function result = computeSum(matrix)
    result = sum(matrix(:));
end
