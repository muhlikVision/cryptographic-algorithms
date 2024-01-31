# RSA Encryption and Decryption in MATLAB

This repository contains a MATLAB implementation of RSA encryption and decryption.

## Overview

RSA (Rivest-Shamir-Adleman) is one of the first public-key cryptosystems and is widely used for secure data transmission. In such a cryptosystem, the encryption key is public and distinct from the decryption key which is kept secret (private). 

## Files

- `RSAFunc.m`: This is the main function that performs RSA encryption or decryption based on the mode. It takes a filename and a mode as inputs. If the mode is 0, it performs encryption. If the mode is 1, it performs decryption.

## Usage

To use this code, you need to have MATLAB installed on your machine. You can run the `RSAFunc` function with the filename and mode as arguments. For example:

```matlab
RSAFunc('message.txt', 0);
