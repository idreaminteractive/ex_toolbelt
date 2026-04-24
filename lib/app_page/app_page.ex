defmodule ExToolbelt.AppPage do
  defmacro __using__(:page) do
    {mod, kind} =
      Application.compile_env(
        :ex_toolbelt,
        :html_provider,
        {Phoenix.Component, :html}
      )

    quote do
      use unquote(mod), unquote(kind)
      @behaviour ExToolbelt.AppPage.Behaviour

      @doc """
      Renders this page with the given assigns, sending an HTML response on `conn`.
      Can be overridden for custom response handling.
      """
      def render(conn, assigns) when is_map(assigns) do
        html = Phoenix.Template.render_to_string(__MODULE__, "page", "html", assigns)

        conn
        |> Plug.Conn.put_resp_content_type("text/html")
        |> Plug.Conn.send_resp(200, html)
      end

      defoverridable render: 2
    end
  end
end
