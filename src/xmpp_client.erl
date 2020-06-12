%%%-------------------------------------------------------------------
%%% @doc
%%%-------------------------------------------------------------------
-module(xmpp_client).
-export([connect/1, connect/2]).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
connect(Url) ->
    connect(Url, []).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
connect(_Url, _Opts) ->
    ok.
