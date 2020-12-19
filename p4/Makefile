newick: newick.l newick.y
	bison -yd newick.y
	flex newick.l
	gcc y.tab.c lex.yy.c -lfl -o newick
	
clean:
	$(RM) lex.yy.c newick y.tab.c y.tab.h