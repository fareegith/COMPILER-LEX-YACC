%{
    #include "y.tab.h"
    int countn=0;
    int total =0 ;
%}

%option yylineno

alpha [a-zA-Z]
digit [0-9]
unary "++"|"--"

%%

#.* {total++; fprintf(yyout,"This is Pre-processor directive: %s\n\n",yytext);}

[''|,|;|(|)|{|}|.|_] {total++; fprintf(yyout,"This is Punctuation: %s\n\n",yytext);}

[[]] {total++; fprintf(yyout,"This is punctuation: %s\n\n",yytext);}

"#"|"@"|"$"|"^"|"%"|"^"|"&" {total++; fprintf(yyout,"This is Special Characters: %s\n\n",yytext);}

"["|"]" {total++; fprintf(yyout,"This is Punctuation: %s\n\n",yytext);}

"="  {total++; fprintf(yyout,"This is Assignment Operator: %s\n\n",yytext);}

"+"|"-"|"*"|"/"  {total++; fprintf(yyout,"This is Arithmatic Operator: %s\n\n",yytext);}

"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"  {total++; fprintf(yyout,"This is Logical Operators: %s\n\n",yytext);}

"<="|">="|"++"|"!="|"=="|"<"|">"  {total++; fprintf(yyout,"This is Relational Operator: %s\n\n",yytext);}

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("read")|("return")|("EOF") {total++; fprintf(yyout,"This is Reserved Word /Keyword: %s\n\n",yytext);}

("self")|("then")|("void")|("while")|("write") {total++; fprintf(yyout,"This is Reserved Word /Keyword: %s\n\n",yytext);}

("attribute")|("class")|("constructor")|("function")|("attribute")|("isa")|("localvar")|("private")|("public")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("void")|("static")|("struct")|("goto") {total++;fprintf(yyout,"This is Reserved Word/ Keyword:%s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {total++; fprintf(yyout,"This is Function: %s\n\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {total++; fprintf(yyout,"This is Identifier: %s\n\n",yytext);}

[0-9]*"."[0-9]+ {total++;fprintf(yyout,"This is Fraction : %s\n\n", yytext);} 

[-][0-9]*"."[0-9]+ {total++;fprintf(yyout,"This is Negative Fraction : %s\n\n", yytext);} 

[0-9]+ {total++; fprintf(yyout,"This is Integer: %s\n\n",yytext);}

"-"[0-9]+ {total++; fprintf(yyout,"This is Negative Integer: %s\n\n",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {total++; fprintf(yyout,"this is String:%s\n\n",yytext);}

"//".*" "*    {total++;fprintf(yyout,"this is single line Commments: %s\n\n",yytext);}

\/\*(.*\n)*.*\*\/    {total++;fprintf(yyout,"this is multi line Comments: %s\n\n",yytext);}

. {fprintf(yyout,"",yytext);}

[\t\n]+

%%

int yywrap() {
    return 1;
}
