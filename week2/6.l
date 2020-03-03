%{
	int oprtrs = 0, oprnds = 0, flag = 0;
%}

%%
("++"|"--"|"+"|"-"|"*"|"/"|"%") {oprtrs++;}
[0-9]+(\.[0-9]+)?|[a-zA-Z][a-zA-Z0-9_]* {oprnds++;}
"(" {flag++;}
")" {flag--;}
(.|\n) ;
%%

int yywrap() {}

int main()
{
	printf("Enter arithmetic expression:\n");
	yylex();
	if(flag == 0)
		printf("Valid expression\nOperators: %d\nOperands: %d\n",oprtrs, oprnds);
	else printf("Invalid expression\n");
	return 0;
}
