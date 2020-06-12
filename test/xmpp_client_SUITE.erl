%%%-------------------------------------------------------------------
%%% @doc
%%%-------------------------------------------------------------------
-module(xmpp_client_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").

suite() ->
    [].

all() ->
    [connect_tcp, connect_ssl].

init_per_suite(Config) ->
    application:ensure_all_started(xmpp_client),    
    Server = os:getenv("XMPP_SERVER"),
    Port = os:getenv("XMPP_PORT"),
    [{server, Server},{port, Port}|Config].

end_per_suite(_Config) ->
    application:stop(xmpp_client),
    ok.

init_per_group(_Group, Config) ->
    Config.

end_per_group(_Group, Config) ->
    ok.

init_per_testcase(_Case, Config) ->
    Config.

end_per_testcase(_Case, Config) ->
    ok.

%%--------------------------------------------------------------------
%% @doc create a connection reference to a tcp end-point.
%%--------------------------------------------------------------------
connect_tcp(Config) ->
    Server = proplists:get_value(server, Config),
    Port = proplists:get_value(port, Config),
    {ok, Pid} = xmpp_client_worker:start_link([{url, Server}, {port, Port}]),
    ok.

%%--------------------------------------------------------------------
%% @doc create a connection reference to ssl/tls end-point.
%%--------------------------------------------------------------------
connect_ssl(Config) ->
    {skip, "todo"}.
