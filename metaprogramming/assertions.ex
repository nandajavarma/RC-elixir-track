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

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :tests, accumulate: true, persist: false)

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro test(desc, do: test_block) do
    func = desc |>
            String.downcase |>
            String.replace(~r/[^a-zA-Z0-9]/, "_") |>
            String.to_atom
    quote do
      @tests {unquote(desc), unquote(func)}
      def unquote(func)(), do: unquote(test_block)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        @tests |> Enum.reverse |> Enum.each(fn {desc, test_case} -> report(desc, apply(__MODULE__,test_case, [])) end)
      end
    end
  end

  def report(desc, :ok), do: IO.write("#{desc} pass")
  def report(desc, {:fail, message}) do
    IO.puts """
      FAIL #{desc}
      #{message}
    """
  end

end
