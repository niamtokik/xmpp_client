%%%-------------------------------------------------------------------
%%% @doc xmpp_client public API
%%% @end
%%%-------------------------------------------------------------------
-module(xmpp_client_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    xmpp_client_sup:start_link().

stop(_State) ->
    ok.
