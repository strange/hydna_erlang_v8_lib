PROJECT = hydna_erlang_v8_lib

DEPS = erlang_v8_lib lager

dep_erlang_v8_lib = git https://github.com/strange/erlang_v8_lib

include erlang.mk

ERLC_OPTS += +'{parse_transform,lager_transform}'
