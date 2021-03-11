defmodule Mix.Tasks.Upgrade do
  use Mix.Task
  use BookDatabase

  def run(_) do
    Amnesia.start

    BookDatabase.Warehouse.create

    Amnesia.transaction do
      # ... initial data creation
    end

    # Stop mnesia so it can flush everything and keep the data sane.
    Amnesia.stop
  end
end
