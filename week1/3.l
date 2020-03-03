%{
	int posi = 0, negi = 0, posf = 0, negf = 0;
%}

digit [0-9]
digits {digit}+(E[+|-]?(\.)?{digit}+)?

%%
[+]?{digits} {posi++;}
-{digits} {negi++;}
[+]?{digit}*\.{digits} {posf++;}
-{digit}*\.{digits} {negf++;}
.|\n {;}
%%

int main() {
	printf("Enter input: ");
	yylex();
	printf("Positve integers = %d\n", posi);
	printf("Negative integers = %d\n", negi);
	printf("Positve fractions = %d\n", posf);
	printf("Negative fractions = %d\n", negf);
	return 0;
}
