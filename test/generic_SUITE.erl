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

    {ok, Data} = erlang_v8_lib:run(<<"
    http.get('http://httpbin.org/status/418').then(function(data) {
        process.return(data);
    });
    ">>),
    #{ <<"code">> := 418 } = Data,

    ok.
