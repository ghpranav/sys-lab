%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern FILE *yyin;
    int ifcount = 0;
    
    int yylex();
    void yyerror(char *msg);
%}

%token IF ELSE VARIABLE COMP UNARY BIN NUM

%%

s:  ifstmt { printf("Valid statement\n"); }
    |
    ;

ifstmt: IF '(' expr ')' '{' 
            statements 
        '}' 
            { ifcount++; }
        |
        IF '(' expr ')' '{'
            statements
        '}' ELSE '{'
            statements
        '}'
            { ifcount++; }
        ;

expr:
        VARIABLE
        | NUM
        | VARIABLE '=' expr
        | expr BIN expr
        | expr UNARY
        | expr COMP expr
        |
        ;

statements:
        statement statements
        |
        ;

statement:
        ifstmt
        | expr ';'
        ;

%%

void yyerror(char *msg) {
    printf("Invalid statement\n");
    exit(1);
}       

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: ./nested_if input\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    yyparse();

    printf("Nested if level: %d\n", ifcount);
    
    return 0;
}
