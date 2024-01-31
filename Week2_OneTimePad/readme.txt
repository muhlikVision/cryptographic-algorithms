# One-Time Pad Encryption and Decryption in MATLAB

This repository contains two MATLAB functions that implement a simple version of the One-Time Pad encryption and decryption method.

## Files

1. `OneTimePad.m`: This function performs the actual encryption and decryption process.
2. `OneTimePadFunc.m`: This function reads the input text or file, generates a random one-time pad, and calls the `OneTimePad` function to encrypt or decrypt the input text.

## Algorithm Overview

The One-Time Pad (OTP) is a type of encryption algorithm that has been proven to be unbreakable when used correctly. It uses a random key, or "pad," that is as long as the plaintext message, and is used only once. Each bit or character from the plaintext is encrypted by combining it with the corresponding bit or character from the pad using modular addition.

In these MATLAB functions, the OTP algorithm is implemented as follows:

1. A random sequence of numbers between 0 and 25 is generated. This serves as the one-time pad.
2. Each character in the input text is converted to its ASCII value.
3. If the character is a lowercase letter, the corresponding number from the one-time pad is added to (for encryption) or subtracted from (for decryption) the ASCII value of the character.
4. If the new ASCII value is outside the range of lowercase letters, it is wrapped around to stay within the range.
5. The new ASCII values are then converted back to characters to get the final encrypted or decrypted text.

## Usage

To encrypt a text file, call the `OneTimePadFunc` function with the name of the input file, the mode set to 0 (for encryption), and the input type set to 1 (for file input).

To decrypt a text file, call the `OneTimePadFunc` function with the name of the input file, the mode set to 1 (for decryption), and the input type set to 1 (for file input).

## Note

These functions are a simple implementation of the OTP algorithm and are not suitable for encrypting sensitive information. They are intended for educational purposes only.
