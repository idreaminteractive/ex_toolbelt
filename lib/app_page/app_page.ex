defmodule ExToolbelt.AppPage do
  @controller_provider Application.compile_env(
                         :ex_toolbelt,
                         :controller_provider,
                         {Phoenix.Controller, [formats: [:html]]}
                       )

  @html_provider Application.compile_env(
                   :ex_toolbelt,
                   :html_provider,
                   {Phoenix.Component, :html}
                 )

  defmacro __using__(:page) do
    {controller_mod, controller_kind} = @controller_provider

    {mod, kind} =
      @html_provider

    quote do
      use unquote(mod), unquote(kind)
      use unquote(controller_mod), unquote(controller_kind)
      import Phoenix.Controller, except: [render: 2, render: 3]
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
