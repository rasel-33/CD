%{
#include <stdio.h>
#include <string.h>
%}

%token IDENTIFIER
%token INVALID_NAME

%%

start: /* empty */
    | start line
    ;

line:
    expression '\n'
    | INVALID_NAME '\n' { printf("Invalid variable name: %s\n", $1); }
    ;

expression:
    IDENTIFIER      { printf("Valid variable name: %s\n", $1); }
    ;

%%

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}

int main() {
    yyparse();
    return 0;
}
