# Bitwise XOR Cipher in MATLAB

This repository contains a MATLAB implementation of the bitwise XOR cipher. The code can handle three types of inputs: text, file, and image.

## Overview of Bitwise XOR Cipher

The bitwise XOR (exclusive OR) operation is a fundamental operation used in cryptography. It is a binary operation that takes two bit patterns of equal length and performs the logical XOR operation on each pair of corresponding bits. The result in each position is 1 if only the first bit is 1 or only the second bit is 1, but will be 0 if both are 0 or both are 1. In this way, the original information can be transformed in a reversible manner, providing a method for encryption and decryption.

## MATLAB Code

The MATLAB code in this repository uses the bitwise XOR operation to encrypt and decrypt inputs. The user provides a key, which is used to perform the XOR operation on the input data. The code can handle three types of inputs:

- Text: The user inputs a string of text, which is then encrypted or decrypted based on the provided key.
- File: The user provides the name of a file. The contents of the file are read, encrypted or decrypted, and then written back to a file.
- Image: The user provides the name of an image file. The image is read and converted to bytes, which are then encrypted or decrypted. The resulting byte array can be converted back to an image.

## Usage

To use the code, call the function `bitXorFunc` with three arguments: the input data (text, file name, or image name), the mode (0 for encryption, 1 for decryption), and the input type (0 for text, 1 for file, 2 for image). The user will be prompted to enter a key, which will be used for the XOR operation.

## Example

Here is an example of how to use the code to encrypt a string of text:

```matlab
bitXorFunc('Hello, world!', 0, 0);