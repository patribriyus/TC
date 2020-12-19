/* Numero de practica: 1
* Ejercicio: 2
* NIP: 735576
* Nombre: Patricia Briones Yus
*/
%{
int contador = 0;
%}
%%
"@hotmail" 	{contador++; printf("@hotmail");}
%%
int main(){
	yylex();
	printf("\nTotal de usuarios: %d", contador);
}