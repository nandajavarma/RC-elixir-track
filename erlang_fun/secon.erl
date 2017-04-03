-module(secon).
-export([get_abst/1]).


get_abst(Filename) ->
        Chunks = beam_lib:all_chunks(Filename),
            Abst = proplists:get_value("Abst", element(3, Chunks)),
                binary_to_term(Abst).
