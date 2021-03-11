require Amnesia

defmodule Mix.Tasks.Query2 do
  use Mix.Task

  def run(_) do
    Amnesia.start
    Amnesia.transaction do
      Elixir.BookDatabase.Warehouse.keys
    end
    Amnesia.stop
  end
end
