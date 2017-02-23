defmodule RadixSort do

  def biggest_number([]), do: nil

  def biggest_number([head | tail]) do
    biggest_number(tail, head)
  end

  def biggest_number([], number), do: length(Integer.digits(number))
  def biggest_number([head | tail], number) do
    biggest = case head > number do
              true -> head
              false -> number
            end
    biggest_number(tail, biggest)
  end

  defp sort_sub(sublist) do
    vlist = Enum.sort_by sublist, fn x -> elem(x, 1) end
    newlist = for i <- vlist, do: elem(i, 0)
    newlist
  end

  defp get_sublist(nlist, d, i \\ 0) do
    slist = sort_sub(for num <- nlist, do: {num, Enum.at(Integer.digits(num, 100000), i - d )})
    if i == d do
      slist
    else
      get_sublist(slist, d-1 , i)
    end
  end

  @spec sort(list) :: list
  def sort([]), do: []

  def sort([one]), do: [one]

  def sort(alist) do
    d = biggest_number(alist)
    get_sublist(alist, d - 1)
  end
end
