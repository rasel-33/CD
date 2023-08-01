%{
#include <stdio.h>
%}

%option noyywrap

%%

/* Regular expression for a valid variable name */
[a-zA-Z_][a-zA-Z0-9_]*   { printf("Valid variable name: %s\n", yytext); }
.                       { printf("Invalid variable name: %s\n", yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            return 1;
        }
        yyin = file;
    }

    yylex();

    if (yyin != stdin) {
        fclose(yyin);
    }

    return 0;
}
