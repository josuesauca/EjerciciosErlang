-module(semaforo1).
-behaviour(gen_statem). 
% comportamientos: arboles de supervisions. muchos procesos tienes estructuras similares
-export([start/2, stop/0, ver_semaforo/0]).
-export([callback_mode/0, init/1, handle_event/4]).

% DEfinir variables globales
-define(TIEMPO_EN_AMARILLO, 3000). % Time 3 sec

% registrar estas partes
-record(state, {
    tiempo_verde :: pos_integer(), % Casteo - Definiciòn del tipo de dato
    tiempo_rojo :: pos_integer()
    }).

start(TiempoVerde, TiempoRojo) ->
    gen_statem:start({local, ?MODULE},?MODULE,
        [TiempoVerde, TiempoRojo], []).
    % Se empiza desde cualquier estado

stop() ->
    gen_statem:stop(?MODULE). % parar desde cualquier estado

callback_mode() ->
    handle_event_function.

init([TiempoRojo, TiempoVerde]) ->
    {ok, rojo, #state{
        tiempo_verde = TiempoVerde,
        tiempo_rojo = TiempoRojo},
    [{state_timeout, TiempoRojo, {cambia, verde}}]}.

ver_semaforo() ->
    gen_statem:call(?MODULE, ver_semaforo).


handle_event(state_timeout, Event, rojo, State) ->
    io:format("Cambia amarillo~n", []),
    {next_state, amarillo, State,
        [{state_timeout, ?TIEMPO_EN_AMARILLO, Event}]};

handle_event(state_timeout, {cambia, verde}, amarillo, State) ->
    io:format("Cambia a Verde~n", []),
    {next_state, verde, State, 
        [{state_timeout, State#state.tiempo_verde, {cambia, rojo}}]};

handle_event(state_timeout, {cambia, rojo}, amarillo, State) ->
    io:format("Cambia a Rojo~n", []),
    {next_state, rojo, State, 
        [{state_timeout, State#state.tiempo_rojo, {cambia, verde}}]};

handle_event(state_timeout, Event, verde, State) ->
    io:format("Cambia a Amarillo~n", []),
    {next_state, amarillo, State, 
        [{state_timeout, ?TIEMPO_EN_AMARILLO, Event}]};

handle_event({call, From}, ver_semaforo, StateName, _StateData) ->
    {keep_state_and_data, [{reply, From, StateName}]}.












