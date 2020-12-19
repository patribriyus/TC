%{
#include "y.tab.h"		// Donde están definidos los tokens
%}

%%
a	{return (A);} // Cuando veas una a devuelve el token A
b	{return (B);}	// Cuando veas una b devuelve el token B
%%