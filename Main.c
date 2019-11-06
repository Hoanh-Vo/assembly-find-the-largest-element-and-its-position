//Author: Hoanh Vo
//Author email: hvo123@csu.fullerton.edu

//Program name: Midterm Programming Test

//Purpose: This program is the Driver of the program
//language: C



#include "stdio.h"

extern long  control_management();

int main()
{
	long   a;   //hold the 
 	
 	
 	printf("Welcome to 240 Assembly language by Hoanh Vo\n");
 	
 	a = control_management();
 	
 	
 	printf("Main received this number %ld  \t",  a);
 	
 	printf("\nHave a nice day.\n");
 	return 0;
}//End of main
