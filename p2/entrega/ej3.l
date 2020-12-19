/* Numero de practica: 2
* Ejercicio: 3
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej3.l
*	       gcc lex.yy.c -lfl -o ej3
*	       ./ej3 <lemario_es.txt >sal.txt
*/
cero	"casa"
unoA	"cas".?
unoB	{cero}.
base	("ca".?|"cas".|("c".?|"ca".|(.?|"c".|."c")"a")"s")
unoC	{base}"a"
dosA	{base}.?
dosB	("cas".?|"casa".|("ca".?|"cas".|("c".?|"ca".|(.?|"c".|."c")"a")"s")"a").
dosCA	(((.?|"c".|."c").?|("c".?|"ca".|(.?|"c".|."c")"a").|(..?|(.?|"c".|."c").|.."c")"a")"s")"a"
dosCB	(("c".?|"ca".|(.?|"c".|."c")"a").?|("ca".?|"cas".|("c".?|"ca".|(.?|"c".|."c")"a")"s").)"a"
%%
\n
{cero}|{unoA}|{unoB}|{unoC}|{dosA}|{dosB}|{dosCA}|{dosCB}		{ECHO;printf("\n");}
.*
%%