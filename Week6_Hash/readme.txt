# HashFunc - A MATLAB Hash Function

## Overview

The `HashFunc` function is a MATLAB script that performs hashing operations on a given file. It reads the contents of a file, hashes the contents using a user-selected method, and writes the hash result to a new file. The format of the hash result depends on the user's choice of output type. The function throws an error if the file does not exist or if an unsupported output type is selected.

## Getting Started

### Prerequisites

To run this project, you will need MATLAB installed on your machine.

### Usage

To use this function, call it with the name of the file you want to hash as an argument, like so:

```matlab
HashFunc('myFile.txt');
