%%%-------------------------------------------------------------------
%%% @doc xmpp_client top level supervisor.
%%% @end
%%%-------------------------------------------------------------------
-module(xmpp_client_sup).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%--------------------------------------------------------------------
%% @doc
%%--------------------------------------------------------------------
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [],
    {ok, {SupFlags, ChildSpecs}}.
