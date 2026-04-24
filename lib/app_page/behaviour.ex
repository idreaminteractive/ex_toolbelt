defmodule ExToolbelt.AppPage.Behaviour do
  @moduledoc """
  Behaviour for self-contained Phoenix page modules.

  Implementing modules must define:
  - `load/2` — derives assigns from a conn and params
  - `render/2` — sends an HTML response (default implementation provided via `use ExToolbelt, :page`)
  """

  @callback load(conn :: Plug.Conn.t(), params :: map()) :: map()
  @callback render(conn :: Plug.Conn.t(), assigns :: map()) :: Plug.Conn.t()
end
