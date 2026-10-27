
%{
#include "y.tab.h"
%}
%%
[A-Za-z][A-Za-z0-9]*  { return ID; }
\n                    ;
.                     { return INVALID; }
%%
int yywrap() { return 1; }
