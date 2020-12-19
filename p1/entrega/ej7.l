/* Numero de practica: 1
* Ejercicio: 7
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej7.l
*	       gcc lex.yy.c -lfl -o ej7
*	       ./ej7 <ent7.txt >sal7.txt
*/

%{
int EA = 0;
int EMD = 0;
int EPS = 0;
int DRM = 0;
int ANTERIOR = 0;
int OCTAVA = 0;
%}
NOTA 	[A-G]
ESP	[ \t]*|[\n]*
OCT	[1-8]{ESP}
ESCALA 	C{OCT}D{OCT}E{OCT}F{OCT}G{OCT}A{OCT}B{OCT}
%%	
{ESCALA}		{EA++;DRM++;ANTERIOR++;if(ANTERIOR==2){EMD++;if(OCTAVA=1){EPS++;}}
				if(ANTERIOR==1){
					int UNO=0;
					int DOS=0;
					int i = 1;
					while(i!=yyleng){
						if(yytext[i]=='1'){UNO++;}
						else if(yytext[i]=='2'){DOS++;}
						i++;
					}
					if(UNO==7 || DOS==7){OCTAVA=1;}
				}}		
C{OCT}D{OCT}E{OCT}	{DRM++;ANTERIOR = 0;OCTAVA=0;}
{NOTA}{OCT}		{ANTERIOR = 0;OCTAVA=0;}		
%%
int main(){
	yylex();
	printf("EA:%d\nEMD:%d\nEPS:%d\nDRM:%d",EA,EMD,EPS,DRM);
}