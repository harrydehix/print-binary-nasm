# print-binary-nasm
macro for printing binaries in nasm

awful code, but it works

## usage

add the macro to your code and just use it like this:
```assembly
PRINT_BINARY 4, edx
PRINT_BINARY 2, dx
PRINT_BINARY 1, dh
PRINT_BINARY 1, dl
PRINT_BINARY 1, 244
PRINT_BINARY 4, -12
PRINT_BINARY 2, 3
PRINT_BINARY 2, [label]
```
