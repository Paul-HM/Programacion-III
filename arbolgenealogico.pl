% --- HECHOS ---
es_hombre(abraham).
es_hombre(herbert).
es_hombre(homero).
es_hombre(clancy).
es_hombre(bart).
es_mujer(mona).
es_mujer(jacquiline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

es_progenitor(abraham,herbert).
es_progenitor(abraham,homero).
es_progenitor(mona,herbert).
es_progenitor(mona,homero).
es_progenitor(clancy,marge).
es_progenitor(clancy,patty).
es_progenitor(clancy,selma).
es_progenitor(jacqueline,marge).
es_progenitor(jacqueline,patty).
es_progenitor(jacqueline,selma).
es_progenitor(homero,bart).
es_progenitor(homero,lisa).
es_progenitor(homero,maggie).
es_progenitor(marge,bart).
es_progenitor(marge,lisa).
es_progenitor(marge,maggie).
es_progenitor(selma,ling).

% --- REGLAS ---
es_padre(X, Y) :- 
    es_progenitor(X, Y), 
    es_hombre(X).

es_madre(X, Y) :- 
    es_progenitor(X, Y), 
    es_mujer(X).

es_abuelo(X, Y) :- 
    es_progenitor(X, Z), 
    es_progenitor(Z, Y),
    es_hombre(X).

es_abuela(X, Y) :- 
    es_progenitor(X, Z), 
    es_progenitor(Z, Y),
    es_mujer(X).

es_hermano(X, Y) :- 
    es_progenitor(Z, X), 
    es_progenitor(Z, Y), 
    es_hombre(X).
      

es_hermana(X, Y) :- 
    es_progenitor(Z, X), 
    es_progenitor(Z, Y), 
    es_mujer(X).

es_tio(X, Y) :- 
    es_progenitor(Z, Y), % Z es padre de Y
   	es_hermano(X, Z),    % X es hermano de Z
	es_hombre(X).

es_tia(X, Y) :- 
    es_progenitor(Z, Y), 
   	es_hermana(X, Z),   
	es_mujer(X).

es_primo(X, Y) :- 
    es_progenitor(Z, Y), 
   	es_progenitor(W, X),    
	(es_hermano(Z,W); es_hermana(Z,W)),
	es_hombre(X).

es_prima(X, Y) :- 
    es_progenitor(Z, Y), 
   	es_progenitor(W, X),    
	(es_hermano(Z,W); es_hermana(Z,W)),
	es_mujer(X).

