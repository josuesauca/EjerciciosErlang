-module(semaforo).
-behaviour(gen_statem).
-compile(export_all).
%%-export([start/2,stop/0,ver_semaforo/0]).

-define(TIEMPO_EN_AMARILLO,3000). %%tiempo en 2 segundos

-record(state,{
   tiempo_verde :: pos_integer(),
   tiempo_rojo :: pos_integer()
}).

start(TiempoVerde,TiempoRojo) ->
    gen_statem:start({local,?MODULE},?MODULE,[TiempoVerde,TiempoRojo],[]).

stop()->
    gen_statem:stop(?MODULE).

callback_mode() ->
    handle_event_function.
    
init([TiempoRojo,TiempoVerde]) ->
    {ok,rojo,#state{
        tiempo_verde = TiempoVerde,
        tiempo_rojo = TiempoRojo
    },[{state_timeout,TiempoRojo, {cambia,verde}}]}.
    
ver_semaforo() ->
    gen_statem:call(?MODULE, ver_semaforo).
    
handle_event(state_timeout,Event,rojo,State) ->
    io:format("Cambia a amarillo ~n",[]),
    {next_state, amarillo,State,[{state_timeout,?TIEMPO_EN_AMARILLO,Event}]};
        
handle_event(state_timeout,{cambia,verde},amarillo,State) ->
    io:format("Cambia a verde ~n",[]),      
    {next_state, verde,State,[{state_timeout,State#state.tiempo_verde,{cambia,rojo}}]};

handle_event(state_timeout,Event,verde,State) ->
    io:format("Cambia a Amarillo ~n",[]),      
    {next_state, amarillo,State,[{state_timeout,?TIEMPO_EN_AMARILLO,Event}]};

handle_event(state_timeout,{cambia,rojo},amarillo,State) ->
    io:format("Cambia a rojo ~n",[]),      
    {next_state, rojo,State,[{state_timeout,State#state.tiempo_rojo,{cambia,verde}}]};
    
    
handle_event({call,From},ver_semaforo,StateName,_StateData) ->
    {keep_state_and_data,[{reply,From, StateName}]}.