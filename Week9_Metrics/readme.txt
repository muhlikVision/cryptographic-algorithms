# MATLAB Metric Function

This repository contains a MATLAB function that performs various operations on a matrix data loaded from a file. The function calculates the sum of the matrix elements and measures the time taken for the computation using different methods. It also displays the memory usage of the matrix.

## Files

- `MetricFUnc.m`: This is the main MATLAB function that performs the operations.

## Functions

- `MetricFUnc(filepath)`: This function takes a file path as input and performs various operations on the matrix data in the file. It uses the `tic` and `toc` functions to measure elapsed time, the `timeit` function to measure execution time, and the `profile on` and `profile off` commands to profile code execution. The `whos` function is used to get information about the variable 'inputMatrix'. The memory usage of 'inputMatrix' is then calculated and displayed.

- `computeSum(matrix)`: This function computes the sum of all elements in a given matrix.

## Usage

To use this function, you need to have MATLAB installed on your machine. You can call the `MetricFUnc` function with the file path of the matrix data as an argument.

```matlab
MetricFUnc('path_to_your_file');
