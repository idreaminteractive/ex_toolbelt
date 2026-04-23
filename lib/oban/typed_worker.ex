defmodule ExToolbelt.Oban.TypedWorker do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      def enqueue_at(%__MODULE__{} = payload, %DateTime{} = future_datetime) do
        payload
        |> Map.from_struct()
        |> __MODULE__.new(scheduled_at: future_datetime)
        |> __ex_toolbelt_oban_insert!()
      end

      def execute(%__MODULE__{} = payload) do
        payload
        |> Map.from_struct()
        |> __MODULE__.new()
        |> __ex_toolbelt_oban_insert!()
      end

      defp __ex_toolbelt_oban_insert!(job) do
        if Code.ensure_loaded?(Oban) and function_exported?(Oban, :insert, 1) do
          apply(Oban, :insert, [job])
        else
          raise ArgumentError,
                "Oban integration used, but :oban dependency missing. Add {:oban, \"~> 2.17\"} to host app deps."
        end
      end
    end
  end
end
