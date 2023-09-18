-module(listas).
-compile(export_all).

cantidad([]) ->
    0;
cantidad([_Cabeza | Cola])->
    1 + cantidad(Cola).
    
cantidadOptimizar(L) ->
    cantidadOptimizarH(L,0).

cantidadOptimizarH([] , Suma) ->
    Suma;
cantidadOptimizarH([_H|T],Suma) ->
    cantidadOptimizarH(T, Suma + 1).

suma([]) ->
    0;
suma([Cabeza | Cola]) ->
    Cabeza + suma(Cola).
    
reversa([]) ->
    [];
reversa([Cabeza | Cola]) ->
    reversa(Cola) ++ [Cabeza].

combinar([],[])->
    [];
combinar(L , [])->
    L;
combinar([] , L)->
    L;
combinar([H1 | T1],[H2 | T2])->
    [H1] ++ [H2] ++ combinar(T1, T2).