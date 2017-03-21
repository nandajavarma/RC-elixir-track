defmodule Temperexgen.WorkerTest do
  use ExUnit.Case

  test "create a worker process" do
    assert {:ok, _} = Temperexgen.Worker.start_link
  end
end
