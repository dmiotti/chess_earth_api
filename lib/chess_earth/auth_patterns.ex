defmodule ChessEarth.AuthPatterns do
  use Expat

  defpat current_user(%{context: %{current_user: %{id: id}}})
end