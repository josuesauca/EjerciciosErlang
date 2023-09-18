-module(utilidades).
-compile(export_all).
%-export([suma/0,suma/2]).


suma()  ->
    X = 8,
    Y = 10,
    Result = X+Y,
    io:format("~w\n",[Result]).
    
suma(X,Y)  ->
    Result = X+Y,
    io:format("~w\n",[Result]),
    Result.
    
fibo(X) 
    when X < 2 -> 
        1;
fibo(X) 
    when X>=2 ->
        fibo(X - 1) + fibo(X -2).
        
factorial(X) when X == 0 -> 1;
factorial(X) when X >= 1 ->
    X * factorial(X-1).
    
facto(X) ->
    if
        X == 0 ->
            1;
        X >= 1 ->
            X * facto(X-1)
    end.

