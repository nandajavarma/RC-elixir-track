{module, first}.  %% version = 0

{exports, [{area,3},
           {double,1},
           {module_info,0},
           {module_info,1},
           {mult,2},
           {square,1},
           {treble,1}]}.

{attributes, []}.

{labels, 15}.


{function, mult, 2, 2}.
  {label,1}.
    {line,[{location,"first.erl",4}]}.
    {func_info,{atom,first},{atom,mult},2}.
  {label,2}.
    {line,[{location,"first.erl",4}]}.
    {gc_bif,'*',{f,0},2,[{x,0},{x,1}],{x,0}}.
    return.


{function, double, 1, 4}.
  {label,3}.
    {line,[{location,"first.erl",6}]}.
    {func_info,{atom,first},{atom,double},1}.
  {label,4}.
    {move,{x,0},{x,1}}.
    {move,{integer,2},{x,0}}.
    {call_only,2,{f,2}}.


{function, area, 3, 6}.
  {label,5}.
    {line,[{location,"first.erl",9}]}.
    {func_info,{atom,first},{atom,area},3}.
  {label,6}.
    {line,[{location,"first.erl",10}]}.
    {gc_bif,'+',{f,0},3,[{x,0},{x,1}],{x,3}}.
    {line,[{location,"first.erl",10}]}.
    {gc_bif,'+',{f,0},4,[{x,3},{x,2}],{x,3}}.
    {line,[{location,"first.erl",10}]}.
    {fconv,{x,3},{fr,0}}.
    {fmove,{float,2.0},{fr,1}}.
    fclearerror.
    {bif,fdiv,{f,0},[{fr,0},{fr,1}],{fr,0}}.
    {line,[{location,"first.erl",11}]}.
    {fconv,{x,0},{fr,2}}.
    {bif,fsub,{f,0},[{fr,0},{fr,2}],{fr,2}}.
    {line,[{location,"first.erl",11}]}.
    {bif,fmul,{f,0},[{fr,0},{fr,2}],{fr,2}}.
    {line,[{location,"first.erl",11}]}.
    {fconv,{x,1},{fr,3}}.
    {bif,fsub,{f,0},[{fr,0},{fr,3}],{fr,3}}.
    {line,[{location,"first.erl",11}]}.
    {bif,fmul,{f,0},[{fr,2},{fr,3}],{fr,2}}.
    {line,[{location,"first.erl",11}]}.
    {fconv,{x,2},{fr,4}}.
    {bif,fsub,{f,0},[{fr,0},{fr,4}],{fr,3}}.
    {line,[{location,"first.erl",11}]}.
    {test_heap,{alloc,[{words,0},{floats,1}]},4}.
    {bif,fmul,{f,0},[{fr,2},{fr,3}],{fr,2}}.
    {fcheckerror,{f,0}}.
    {fmove,{fr,2},{x,0}}.
    {line,[{location,"first.erl",11}]}.
    {call_ext_only,1,{extfunc,math,sqrt,1}}.


{function, square, 1, 8}.
  {label,7}.
    {line,[{location,"first.erl",13}]}.
    {func_info,{atom,first},{atom,square},1}.
  {label,8}.
    {line,[{location,"first.erl",13}]}.
    {gc_bif,'*',{f,0},1,[{x,0},{x,0}],{x,0}}.
    return.


{function, treble, 1, 10}.
  {label,9}.
    {line,[{location,"first.erl",14}]}.
    {func_info,{atom,first},{atom,treble},1}.
  {label,10}.
    {line,[{location,"first.erl",14}]}.
    {gc_bif,'*',{f,0},1,[{x,0},{x,0}],{x,1}}.
    {line,[{location,"first.erl",14}]}.
    {gc_bif,'*',{f,0},2,[{x,1},{x,0}],{x,0}}.
    return.


{function, module_info, 0, 12}.
  {label,11}.
    {line,[]}.
    {func_info,{atom,first},{atom,module_info},0}.
  {label,12}.
    {move,{atom,first},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 14}.
  {label,13}.
    {line,[]}.
    {func_info,{atom,first},{atom,module_info},1}.
  {label,14}.
    {move,{x,0},{x,1}}.
    {move,{atom,first},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
