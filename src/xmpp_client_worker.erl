%%%-------------------------------------------------------------------
%%% @doc
%%%-------------------------------------------------------------------
-module(xmpp_client_worker).
-export([start_link/0, start_link/1, start_link/2]).
-export([init/1, terminate/3, callback_mode/0]).
-export([server_init/3]).
-include("xmpp_client.hrl").
-behavior(gen_statem).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
start_link() ->
    start_link([]).

start_link(Args) ->
    start_link(Args, []).

start_link(Args, Opts) ->
    gen_statem:start_link(?MODULE, Args, Opts).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
callback_mode() -> state_functions.

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
-spec init(Args) -> Result when
      Args :: proplists:proplist(),
      Result :: {ok, xmpp:socket_state()}.
init(Args) ->
    Url = proplists:get_value(url, Args),
    Port = value_to_port(proplists:get_value(port, Args)),
    Username = proplists:get_value(username, Args),
    Password = proplists:get_value(password, Args),
    Options = proplists:get_value(opts, Args, []),
    {ok, Data} = xmpp_socket:connect(Url, Port, Options),
    {ok, server_init, Data}.

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
-spec value_to_port(Port) -> Return when
      Port :: list() | integer(),
      Return :: integer().
value_to_port(Port) when is_list(Port) ->
    erlang:list_to_integer(Port);
value_to_port(Port) when is_integer(Port) ->
    Port.

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
terminate(_Reason, _State, _Data) ->
    ok.

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
server_init(info, {tcp, _Port, <<>>}, Data) ->
    {stream, noreply, Data};
server_init(info, _Message, Data) ->
    {stop, Data}.

stream(info, {tcp, _Port, Message}, Data) ->
    {stop, Data}.
