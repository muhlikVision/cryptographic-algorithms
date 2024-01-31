# Classic Cipher MATLAB Functions

This repository contains two MATLAB functions that implement a classic cipher, specifically a Caesar cipher, for text encryption and decryption.

## Overview of Caesar Cipher

A Caesar cipher is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is 'shifted' a certain number of places down the alphabet. For example, with a shift of 1, A would be replaced by B, B would become C, and so on. The method is named after Julius Caesar, who apparently used it to communicate with his officials.

## Function 1: classicCipher

This function implements a classic Caesar cipher for text encryption and decryption. It takes four inputs: `type` (0 for encryption, 1 for decryption), `shift` (the number of positions to shift each character), `len` (the length of the text), and `user_text` (the text to be encrypted or decrypted). The function returns the encrypted or decrypted text.

## Function 2: classicCipherFunc

This function implements a classic Caesar cipher for text encryption and decryption. It takes three inputs: `fileName` (the name of the file or the text to be encrypted or decrypted), `mode` (0 for encryption, 1 for decryption), and `inputType` (0 for text input, 1 for file input). The function reads the input, converts it to lowercase, and then calls the `classicCipher` function to encrypt or decrypt the text.

## Usage

To use these functions, you need to have MATLAB installed on your computer. You can call these functions from the MATLAB command window or from a MATLAB script. Make sure to set the MATLAB current folder to the folder containing these functions.

## License

These functions are released under the MIT license.
