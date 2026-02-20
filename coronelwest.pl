% --- HECHOS ---
es_hostil(coreadelsur).
es_estadounidense(coronelwest).
tiene_armas(coreadelsur).
vendio_armas(coronelwest, coreadelsur).

% --- REGLAS ---
es_criminal(X) :-
    es_estadounidense(X),
    vendio_armas(X, Y),
    es_hostil(Y).