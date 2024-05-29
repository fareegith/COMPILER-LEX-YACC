// for identified tokens as keywords, delimeter, operation.....
flex lexeme.l
bison -y -d tkn.y
gcc -c y.tab.c lex.yy.c
gcc -o a.exe y.tab.c
a.exe < input.c
a.exe < text10.txt



// creating symbol table
flex lexer.l
bison -y -d symbolT.y
gcc -c y.tab.c lex.yy.c
gcc -o t.exe y.tab.c
t.exe < input.c
t.exe < text10.txt
