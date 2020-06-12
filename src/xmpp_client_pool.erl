%%%-------------------------------------------------------------------
%%% @doc
%%%-------------------------------------------------------------------
-module(xmpp_client_pool).
-export([start_link/0, start_link/1, start_link/2]).
-export([init/1, terminate/2]).
-export([handle_cast/2, handle_call/3, handle_info/2]).
-behavior(gen_server).

start_link() ->
    start_link([]).

start_link(Args) ->
    start_link(Args, []).

start_link(Args, Opts) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, Args, Opts).

init(_Args) ->
    {ok, []}.

terminate(_Reason, _State) ->
    ok.

handle_cast(_Message, _State) ->
    {stop, not_supported}.

handle_call(_Message, _From, _State) ->
    {stop, not_supported}.

handle_info(_Message, _State) ->
    {stop, not_supported}.
