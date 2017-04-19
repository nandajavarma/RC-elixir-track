defmodule Assertions do
  defmacro assert({operator, _, [lhs, rhs]}) do
    quote do
      do_assert(unquote(operator), unquote(lhs), unquote(rhs))
    end
  end

  def do_assert(:==, lhs, rhs) when lhs==rhs do
    IO.write(".")
  end
  def do_assert(:==, lhs, rhs) do
    IO.puts """
      FAIL: Expected: #{rhs}
      GOT: #{lhs} on the left
      """
  end
end
