defmodule Temperexgen.WorkerTest do
  use ExUnit.Case

  test "create a worker process" do
    assert {:ok, _pid} = Temperexgen.Worker.start_link(:mytemp)
    temp = Temperexgen.Worker.get_temperature(:mytemp, "Kerala")
    assert Regex.match?(~r/°C/, temp)
    Temperexgen.Worker.get_temperature(:mytemp, "Singapore")
    Temperexgen.Worker.get_temperature(:mytemp, "New York")
    Temperexgen.Worker.get_temperature(:mytemp, "Bruges")
    Temperexgen.Worker.get_temperature(:mytemp, "Killarney")
    state = Temperexgen.Worker.get_state(:mytemp)
    assert state == %{"Bruges" => 1, "Kerala" => 1, "Killarney" => 1, "New York" => 1, "Singapore" => 1}
    Temperexgen.Worker.reset_state(:mytemp)
    assert Temperexgen.Worker.get_state(:mytemp) == %{}
    assert :ok = Temperexgen.Worker.stop(:mytemp)
  end
end
