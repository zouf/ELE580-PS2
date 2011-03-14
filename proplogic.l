%{
#include <stdlib.h>
#include "proplogic.h"
#include "y.tab.h"
void yyerror(char *);
%}

%%

[a-z]       {
                yylval.sIndex = *yytext - 'a';
                return VARIABLE;
            }

[T]          {
                return TRUE;
             }

[F]          {
                return FALSE;
             }
              


[-()<>=+*/;{}.] {
                return *yytext;
             }

"|"           return OR;
"&"           return AND;
"=>"          return IMPLIES;
"<=>"         return EQUIV;
"!"           return NOT;


[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
