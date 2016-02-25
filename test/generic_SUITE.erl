-module(generic_SUITE).

-include_lib("common_test/include/ct.hrl").

-export([all/0]).
-export([init_per_suite/1]).

-export([lol/1]).

all() ->
    [
        lol
    ].

init_per_suite(Config) ->
    application:ensure_all_started(hydna_erlang_v8_lib),
    Config.

lol(_Config) ->
    {ok, <<"lol">>} = erlang_v8_lib:run([
        {context, #{ type => lol }},
        {eval, <<"process.return(Event.getType());">>}
    ]),

    {ok, <<"test">>} = erlang_v8_lib:run(<<"
    Channel.emit('test', 'fest').then(function(v) {
        process.return(v);
    });
    ">>, #{
        handler_context => #{ domain => <<"test">> }
    }),

    ok.
