lex subc-compiler.l
yacc cCompilerWithfinc.y -d
gcc y.tab.c -ll
./a.out test
