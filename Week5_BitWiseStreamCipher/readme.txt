# Bitwise Stream Cipher in MATLAB

This repository contains a MATLAB implementation of a bitwise stream cipher. The main function is `BitWIseSCFunc`, which performs encryption and decryption based on the mode specified.

## Overview of Bitwise Stream Cipher

A bitwise stream cipher is a method of encryption where each bit of plaintext is combined with a bit from a pseudorandom cipher digit stream (keystream). The most commonly used combination operation is the XOR (exclusive OR) operation. 

The pseudorandom cipher digit stream is generated using a key, which is known only to the sender and receiver of the message. This ensures that even if an attacker knows everything about the system, they cannot decrypt the message without the key.

## Functionality

The `BitWIseSCFunc` function takes two inputs: 'text' and 'mode'. 'text' is the name of the input file, and 'mode' is the operation mode (0 for encryption, 1 for decryption).

In encryption mode, the function reads the plaintext and the key from their respective files, converts the plaintext to base64 binary, generates a pseudorandom byte stream of the same length as the base64 binary using the key, and then encrypts the base64 binary by performing a bitwise XOR operation with the pseudorandom byte stream. The encrypted data (in both Unicode and Hex formats) and the key are then written to their respective files.

In decryption mode, the function reads the encrypted data and the key from their respective files, decrypts the encrypted data by performing a bitwise XOR operation with the key, converts the decrypted data (in base64 binary) back to text, and then writes the decrypted text to a file.

## Dependencies

This function relies on two other functions, `PRGA` and `KSA`, which are not defined in this code. These functions are typically part of the RC4 algorithm, where `KSA` (Key-Scheduling Algorithm) is used to initialize the state, and `PRGA` (Pseudo-Random Generation Algorithm) generates the keystream.

## Usage

To use this function, simply call `BitWIseSCFunc(text, mode)` in MATLAB, where 'text' is the name of the input file and 'mode' is the operation mode (0 for encryption, 1 for decryption).


Cite As
kareem ahmed (2022). RC4 (https://www.mathworks.com/matlabcentral/fileexchange/67242-rc4), 
MATLAB Central File Exchange. Retrieved July 10, 2022.

Explanation is here:

https://www.youtube.com/watch?v=1UP56WM4ook