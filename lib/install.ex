defmodule Mix.Tasks.Install do
  use Mix.Task
  use BookDatabase

  def run(_) do
    Amnesia.Schema.create

    Amnesia.start

    # BookDatabase.create(ram: [node])
    BookDatabase.create(disk: [node])

    # This waits for the database to be fully created.
    BookDatabase.wait

    Amnesia.transaction do
      # ... initial data creation
      %Book{sku: "9780747591054", author: "J. K. Rowling", title: "Harry Potter and the Deathly Hallows"} 
      |> Book.write
    end

    # Stop mnesia so it can flush everything and keep the data sane.
    Amnesia.stop
  end
end
