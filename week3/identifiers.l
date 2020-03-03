%{
	int flag=0, id=0;
	FILE *fp;
%}

/* Rules */
keyword "int"|"char"|"float"|"double"
chars [a-zA-Z]
digit [0-9]
us _

%%
{keyword} {flag=1;}
{chars}({chars}|{digit}|{us})* {if(flag!=0 && strcmp(yytext, "main") != 0) {
		id++; printf("%s\n",yytext);
	} }
";" {flag=0;}
(.|\n) ; /* Ignore anything else */
%%

int yywrap(void) {}

int main()
{
	fp = (FILE *) fopen("input.c", "r");
	yyin = fp;
	yylex();
	printf("Number of identifiers: %d\n", id);
	return 0;
}

