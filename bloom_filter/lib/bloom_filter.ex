defmodule BloomFilter do
  @moduledoc """
  Documentation for BloomFilter.
  """

  @doc """

  ## Examples


  """
  def init(size) do
    seed1 = :rand.uniform(size)
    seed2 = :rand.uniform(size)
    hash1 = fn x -> rem(Murmur.hash_x86_32(x, seed1), size) end
    hash2 = fn x -> rem(Murmur.hash_x86_32(x, seed2), size) end
    %{'bitmap' => Bitmap.new(size),
      'hash_functions' => [hash1, hash2]}
  end

  def bit_update(_value, bitmap, []), do: bitmap

  def bit_update(value, bitmap, [head| tail]) do
    bit_update(value, Bitmap.set(bitmap, head.(value)), tail)
  end


  def add(filter, value) do
    bitmap = bit_update(value, filter['bitmap'], filter['hash_functions'])
    Map.update(filter, 'bitmap', 0, fn (_x) -> bitmap end)
  end


  def in?(filter, value) do
    Enum.all?(for fun <- filter['hash_functions'], do: Bitmap.set?(filter['bitmap'], fun.(value)))
  end
end
