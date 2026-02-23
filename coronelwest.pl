% --- HECHOS ---
es_hostil(coreadelsur).
es_estadounidense(coronelwest).
vendio_armas(coronelwest, coreadelsur).

% --- REGLAS ---
es_criminal(X) :-
    es_estadounidense(X),
    vendio_armas(X, Y),
    es_hostil(Y).
