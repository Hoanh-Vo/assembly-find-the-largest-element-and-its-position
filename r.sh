#!/bin/bash

#Author: Hoanh Vo
#Author email: hvo123@csu.fullerton.edu
#Midterm Programming Test
#Purpose: This program compiles files, links objects and create executable file.



rm *.out
rm *.o

echo "Compile the driver module............................"

gcc -c -m64 -g -Wall -o cMain.o Main.c -fno-pie -no-pie

echo "Assemble the control module.........................."

nasm -f elf64 -g -l asm_Manage.lis -o asmManage.o manage.asm

echo "Compile the Fill module.............................."
g++ -c -g -Wall -m64 -std=c++14 -fno-pie -no-pie -o cppFill.o Fill.cpp

echo "Compile the Display module..........................."
gcc -c -Wall -m64 -g -fno-pie -no-pie -o cppDis.o Display.c

echo "Compile the maximum module..............................."
nasm -f elf64 -g -l asmMaximum.lis -o asmmaximum.o maximum.asm

echo "Link 3 object files..............................."
g++ -Wall -m64 -g -o Final.out cMain.o asmManage.o cppFill.o  cppDis.o asmmaximum.o -fno-pie -no-pie

#asmmaximum.o

echo "Run the executable-final File........................"
./Final.out

echo "The Bash file says good-bye.........................."
