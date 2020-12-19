calcMejor: calcMejor.l calcMejor.y
	bison -yd calcMejor.y
	flex calcMejor.l
	gcc -o calcMejor y.tab.c lex.yy.c -lfl -lm