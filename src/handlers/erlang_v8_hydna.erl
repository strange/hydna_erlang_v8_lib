-module(erlang_v8_hydna).

-export([run/2]).

run([<<"emit">>, Path, _Data], #{ domain := _Domain }) ->
    %% hydna_domain:emit_to_channel(DomainName, Path, Data),
    {ok, Path};

run([<<"send">>, Path, _Data], #{ domain := _Domain }) ->
    %% hydna_domain:send_to_channel(DomainName, Path, 1, 0, Data),
    {ok, Path}.
