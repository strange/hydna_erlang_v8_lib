-module(hydna_erlang_v8_lib_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Opts = #{
        extra_handlers => [
            {<<"hydna">>, erlang_v8_hydna}
        ],
        extra_modules => [
            {hydna_erlang_v8_lib, "misc.js"},
            {hydna_erlang_v8_lib, "channel.js"},
            {hydna_erlang_v8_lib, "event.js"}
        ]
    },
    SupFlags = #{
        strategy => one_for_one,
        intensity => 1,
        period => 5
    },
    ChildSpecs = [#{
        id => erlang_v8_lib_sup,
        start => {erlang_v8_lib_sup, start_link, [Opts]},
        type => supervisor
    }],
    {ok, {SupFlags, ChildSpecs}}.
