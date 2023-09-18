%%Examen Unidad 2
%%Integrantes : Josue Sauca
%% - Josue Sauca
%% - Xavier Gutierrez
-module(prueba_unidad).
-compile(export_all).

generate_random_list(N) ->
    generate_random_list(N, []).

generate_random_list(0, Acc) ->
    lists:reverse(Acc);

generate_random_list(N, Acc) ->
    RandomNumber = random:uniform(40),  
    generate_random_list(N - 1, [RandomNumber | Acc]).

calcular_circunferencia(A) ->
    Dato_Obtenido = lists:nth(rand:uniform(length(A)), A),
    S = math:pi() * Dato_Obtenido * Dato_Obtenido,
    io:format("El valor de la circunferencia con un radio de ~p es ~p~n",[Dato_Obtenido,S]).

calcular_triangulo(A) ->
    Base = lists:nth(rand:uniform(length(A)), A),
    Altura = lists:nth(rand:uniform(length(A)), A),
    S = ((Base*Altura)/2),
    io:format("El valor de la superficie con una base de ~p y una altura de ~p es ~p~n",[Base,Altura,S]).

calcular_esfera(A) ->
    Radio = lists:nth(rand:uniform(length(A)), A),
    S = (4/3)*(math:pi() * (Radio*Radio*Radio)),
    io:format("El valor del volumen de una esfera con una radio de ~p es ~p~n",[Radio,S]).

fibo(0) -> 
    0;
fibo(1) -> 
    1;
fibo(N) -> 
    fibo(N-1) + fibo(N-2).

calcular_fibonacci(A) ->
    ValorUno = lists:nth(rand:uniform(length(A)), A),
    ValorDos = lists:nth(rand:uniform(length(A)), A),
    
    Fibo_Uno = fibo(ValorUno),
    Fibo_Dos = fibo(ValorDos),

    SumaTotal = Fibo_Uno + Fibo_Dos,

    io:format("El fibonaci de ~p es ~p~n",[ValorUno,Fibo_Uno]),
    io:format("El fibonaci de ~p es ~p~n",[ValorDos,Fibo_Dos]),
    io:format("La sumatoria de ambos valores es ~p~n",[SumaTotal]).