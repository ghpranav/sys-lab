%{
	#include<stdio.h>
	int pc=0, sc=0;
%}

%%
"printf" {pc++;fprintf(yyout,"WRITE");}
"scanf" {sc++;fprintf(yyout,"READ");}
%%

int yywrap() {}

int main() {
	yyin=fopen("input.c","r");
	yyout=fopen("output.c","w");
	
	yylex();
	
	printf("printf count = %d\nscanf count = %d\n", pc, sc);
	return 0;
}
