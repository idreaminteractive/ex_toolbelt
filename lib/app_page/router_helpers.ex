defmodule ExToolbelt.AppPage.RouterHelpers do
  @moduledoc """
  Optional helpers for use in Phoenix routers.

  ## Example

      defmodule MyAppWeb.Router do
        use Phoenix.Router
        import ExToolbelt.RouterHelpers

        scope "/", MyAppWeb.Pages do
          page "/", Home, :index
          page "/about", About, :index
        end
      end
  """

  @doc """
  A thin wrapper around `get` that documents intent — this route is backed
  by an `ExToolbelt.Page` module.
  """
  defmacro page(path, module, action) do
    quote do
      get(unquote(path), unquote(module), unquote(action))
    end
  end
end
