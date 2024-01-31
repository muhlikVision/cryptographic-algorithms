# DES Block Cipher MATLAB Implementation

This repository contains a MATLAB implementation of the Data Encryption Standard (DES) block cipher. DES is a symmetric-key algorithm for the encryption of digital data[^1^][2]. Although its short key length of 56 bits makes it too insecure for modern applications, it has been highly influential in the advancement of cryptography[^1^][2].

## Overview of DES Block Cipher

The Data Encryption Standard (DES) is a symmetric-key block cipher[^2^][3]. It operates on 64-bit blocks of data, which are fed through the cipher with a 56-bit key, producing 64-bit blocks of ciphertext[^3^][4]. Internally, DES is composed of a series of mathematical structures known as Feistel networks, which perform the actual encryption[^3^][4].

DES encrypts data in blocks of size of 64 bits each, which means 64 bits of plain text go as the input to DES, which produces 64 bits of ciphertext[^4^][1]. The same algorithm and key are used for encryption and decryption, with minor differences[^4^][1]. The key length is 56 bits[^4^][1].

Despite its vulnerabilities, DES has played a significant role in data security[^4^][1]. However, due to the relatively short 56-bit key size, DES is considered insecure for many applications[^1^][2]. In its place, Triple DES and the Advanced Encryption Standard (AES) are commonly used[^1^][2].

## MATLAB Code

The MATLAB code in this repository provides a function `DESFUNC` that performs encryption and decryption using the DES algorithm. The function takes two inputs: 'text' and 'mode'. 'text' is the input text to be encrypted or decrypted. 'mode' is a flag that determines whether to encrypt (0) or decrypt (1).

Please refer to the comments in the MATLAB code for a detailed explanation of each part of the code.

## References

[^4^][1]: [Data encryption standard (DES) | Set 1 - GeeksforGeeks](https://www.geeksforgeeks.org/data-encryption-standard-des-set-1/)
[^1^][2]: [Data Encryption Standard - Wikipedia](https://en.wikipedia.org/wiki/Data_Encryption_Standard)
[^2^][3]: [Block Cipher and Data Encryption Standard (DES)](http://www.parkjonghyuk.net/lecture/2021-1st-lecture/CIS/chap3.pdf)
[^3^][4]: [Deciphering Encryption: The DES Block Cipher | GRA Quantum](https://graquantum.com/deciphering-encryption-des-block-cipher/)
