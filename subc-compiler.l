alpha [a-zA-Z_]
digit [0-9]
%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

%%
[ \t]		;
[ \n]   { yylineno = yylineno + 1;}
"int"	return INT;
"char"  return CHAR;

"void" return VOID;
"while"	return WHILE;

"if"	return IF;
"else"	return ELSE;
^"#include ".+ ;
\'{alpha}+\' {return STR;}
{digit}+      {yylval.charval = strdup(yytext); return NUM;}
{alpha}({alpha}|{digit})* { yylval.charval = strdup(yytext); return ID;}
"="     return ASGN;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
">"	return GT;
"<"	return LT;
"||" 	return LOR;
"&&"  	return LAND;
"|" 	return BOR;
"&"	return BAND;
"^"	return BXOR;
"("	return O_PAR;
")"	return C_PAR;
#.* ;
#\*(.*\n)*.*\*\# ;   
.       return yytext[0];
%%
