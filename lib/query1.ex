require Amnesia

defmodule Mix.Tasks.Query1 do
  use Mix.Task

  def run(_) do
    Amnesia.start
    Amnesia.transaction do
      Mix.shell.info "before"
      Mix.shell.info inspect(Elixir.BookDatabase.Book.keys)
      Mix.shell.info "after"
    end
    Amnesia.stop
  end
end
