-module(funciones).
-compile(export_all).

init() ->
    io:format("1. Superficie Cuadrado ~n"),
    io:format("2. Superficie Rectangulo ~n"),
    io:format("3. Superficie Triangulo ~n"),
    io:format("4. Superficie de Circunferencia ~n"),
    io:format("Ingrese la opcion : "),
    Data = string:trim(io:get_line(" ")),
    %%io:format("Ha ingresado: ~p~n", [Data]),
    Convertir = string:to_integer(Data),
    {ValoComparar, Aux} = Convertir,
    case ValoComparar of
        1 ->
            calculo_cuadrado();
        2 ->
            calculo_rectangulo();
        3 ->
            calculo_triangulo();
        4 ->
            calculo_circulo();
        _ ->
            io:format("Value does not match any case.~n")
    end.

calculo_cuadrado() ->
    io:format("Ingrese el valor de un lado del cuadrado : "),
    Dato = string:trim(io:get_line(" ")),
    Convertir = string:to_integer(Dato),
    {ValorLado, Aux} = Convertir,
    Calculo = ValorLado * ValorLado,
    io:format("El lado que ingreso es ~p y su superficie es ~w~n",[Dato,Calculo]),
    File = "./nuevo.txt",
    Concatenated = lists:concat(["El valor del cuadrado es : ", integer_to_list(Calculo)]),
    ok = file:write_file(File, Concatenated),
    init().

calculo_rectangulo() ->
    io:format("Ingrese el ancho del rectangulo: "),
    AnchoString = string:trim(io:get_line(" ")),
    io:format("Ingrese el largo del rectangulo: "),
    LargoString = string:trim(io:get_line(" ")),
    ConvertirAncho = string:to_integer(AnchoString),
    ConvertirLargo = string:to_integer(LargoString),
    {AnchoRectangulo, Aux1} = ConvertirAncho,
    {LadoRectangulo, Aux2} = ConvertirLargo,
    Calculo = AnchoRectangulo * LadoRectangulo,
    io:format("La superficie es ~w~n",[Calculo]),
    File = "./nuevo.txt",
    Concatenated = lists:concat(["La superficie del rectangulo : ", integer_to_list(Calculo)]),
    ok = file:write_file(File, Concatenated),
    init().

calculo_triangulo()->
    io:format("Ingrese la altura del triangulo: "),
    AlturaString = string:trim(io:get_line(" ")),

    io:format("Ingrese el ancho del triangulo: "),
    AnchoString = string:trim(io:get_line(" ")),

    ConvertirAltura = string:to_integer(AlturaString),
    ConvertirAncho = string:to_integer(AnchoString),

    {AnchoTriangulo, Aux1} = ConvertirAncho,
    {AltoTriangulo, Aux2} = ConvertirAltura,

    Calculo = ((AnchoTriangulo * AltoTriangulo)/2),
    io:format("La superficie es ~w~n",[Calculo]),

    File = "./nuevo.txt",
    Concatenated = lists:concat(["La superficie del triangulo es : ", float_to_list(Calculo)]),
    ok = file:write_file(File, Concatenated),
    init().


calculo_circulo() ->
    io:format("Ingrese el valor del radio del circulo : "),
    Dato = string:trim(io:get_line(" ")),
    Convertir = string:to_integer(Dato),

    {ValorRadio, Aux} = Convertir,
    Calculo = math:pi() * (ValorRadio*ValorRadio),
    io:format("La superficio del circulo es ~w~n",[Calculo]),
    Concatenated = lists:concat(["La superficio del circulo es : ", float_to_list(Calculo)]),

    File = "./nuevo.txt",
    ok = file:write_file(File, Concatenated),
    init().

