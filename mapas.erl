-module(mapas).
-compile(export_all).

test() ->
    %% Constructor 1
    _Map1 = maps:new(),
    %% Constructor 2
    _Map2 = #{key => value},
    %% Constructor desde lista
    Map3 = maps:from_list([{key1, value1}, {key2, value2}]),
    %% Mapa a lista
    io:format("El mapa es ~w\n", [maps:to_list(Map3)]),
    %% Insertando un valor
    %% Map3#{nueva_clave => nuevo_valor}
    Map4 = maps:put(nueva_clave, nuevo_valor, Map3),
    io:format("Despues de insertar nueva_clave, el mapa es ~w\n", [maps:to_list(Map4)]),
    %% Modificar un valor
    %% Map4#{key_2 => nuevo_valor}
    %% Map4#{key_2 := nuevo_valor}
    Map5 = maps:put(key2, nuevo_valor_de_2, Map4),
    io:format("Depue de modificar key2 el mapa es ~w\n",[maps:to_list(Map5)]),
    %%Elminiar un elemento
    Map6 = maps:remove(nueva_clave,Map5),
    io:format("Despues de eleiminar nueva_Calve, el mapa es ~w\n",[maps:to_list(Map6)]),
    %%Tmanio de la lista 
    io:format("El tamanio del mapa es ~w\n",[maps:size(Map6)]),
    %%Obtener todos los valores
    Valores = maps:values(Map6),
    %%Obtener todos los valores
    io:format("Los valores contenidos en el mapa son ~w\n",[Valores]),
    %%Iteramos a travez de un mapa 
    Imprimir = fun(K,V)-> io:format("~w => ~w\n",[K,V]) end,
    maps:map(Imprimir,Map6),
    Map6.
    