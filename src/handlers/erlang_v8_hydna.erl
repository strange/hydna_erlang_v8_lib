-module(erlang_v8_hydna).

-export([run/2]).

run([<<"send">>, Path, Data], #{ domain := Domain }) ->
    hydna_domain:send_to_path(Domain, Path, Data),
    {ok, Path};

run(_, _) ->
    {error, function_clause}.
