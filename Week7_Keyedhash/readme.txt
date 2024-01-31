# Keyed Hash Function in MATLAB

## Overview
This MATLAB function, `KeyHashFunc`, generates a hash for a file using a key and a specified hashing method. The key is read from a file named 'key.txt'. The hashing method is input by the user at runtime. The generated hash is then written to a file named 'data_hash.txt'.

## Keyed Hash
A keyed hash is a cryptographic hash function that uses a key to generate a unique hash. This is often used in data integrity checks, digital signatures, and message authentication codes (MACs). The key ensures that even if two different inputs produce the same hash, changing the key will result in a different hash, providing an additional layer of security.

## Usage
1. Place the file you want to hash in the same directory as the `KeyHashFunc` function.
2. Run the `KeyHashFunc` function with the filename as the argument.
3. When prompted, enter the hashing method you want to use (SHA-1, SHA-256, SHA-384, or SHA-512).
4. The function will display the file data and write the generated hash to 'data_hash.txt'.

## Example
```matlab
KeyHashFunc('example.txt');
