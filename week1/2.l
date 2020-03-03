%{
	int charc = 0, wordc = 0, blankc = 0, linec = 0;
%}

char [a-zA-Z]
blank [ ]
line [\n]

%%
({char}+) {wordc++; charc += yyleng;}
{blank} {blankc++;}
{line} {linec++;}
%%

int main() {
	yylex();
	printf("Char = %d \nWords = %d \nBlanks = %d \nLines = %d\n", charc, wordc, blankc, linec);
}
