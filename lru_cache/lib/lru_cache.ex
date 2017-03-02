defmodule LruCache do
  @moduledoc """
  Documentation for LruCache.
  Implemented to solve the problem here: http://mcicpc.cs.atu.edu/archives/2012/mcpc2012/lru/lru.html
  """

  @doc """

  """

  def encache(_, _, _, 0) do
    nil
  end

  def encache([], result, _cache, _size) do
    result
  end

  def encache([term| ttail], result, cache, size) do
    case term do
      "!" -> encache(ttail, result ++ [List.to_string(cache)], cache, size)
      _   ->
             if Enum.member?(cache, term) do
              encache(ttail, result, List.delete(cache, term) ++ [term], size)
             else
              case length(cache) == size do
                true ->
                      encache(ttail, result, tl(cache) ++ [term], size)
                _    ->
                      encache(ttail, result, cache ++ [term], size)
              end
            end
    end
  end

  def get_pages(size, strings \\ "") do
    String.graphemes(strings) |>
      encache([], [], size)
  end
end
