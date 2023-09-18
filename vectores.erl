-module(vectores).
-compile(export_all).

test() ->
    %%Crear un array con 20 elementos
    A0 = array:new(20),
    %%Setera elementos
    A1 = array:set(0, 1, A0),
    A2 = array:set(10, 20, A1),
    %%Convertir el array e lista
    io:format("El vector es ~w\n",[array:to_list(A2)]),
    %%Acceso directo
    io:format("El elemento en el indice 10 es ~w\n",[array:get(10,A2)]),
    %% Convertir un array en otro visitando cada uno de los elementos
    Convertidor = fun(_Idx, Val)->
                        if is_integer(Val)->
                            Val * 2;
                        
                            true ->
                                Val
                        end
                    end,
    A3 = array:map(Convertidor, A2),
    io:format("El nuevo array es ~w\n",[array:to_list(A3)]),
    %%Modificar el tamanio a 5
    A4 = array:resize(5,A2),
    io:format("Si lo resizeo a 5 el array es ~w\n",[array:to_list(A4)]),
    %%Bloquear su el array esta bloqueado
    A5 = array:fix(A4),
    %%Verificar si el array esta bloqeuado
    case array:is_fix(A5) of
        true ->
            io:format("El resizeo del array esta bloquead\n");
        false ->
            io:format("El resizeo del arraya no esta bloqueado")
    end,
    %%Desbloquear el resizeo del array
    A6 = array:relax(A5),
    case array:is_fix(A6) of
        true ->
            io:format("El resizeo del array esta bloquead\n");
        false ->
            io:format("El resizeo del arraya no esta bloqueado")
    end,
    A4.
