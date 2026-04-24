defmodule ExToolbelt.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_toolbelt,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oban, "~> 2.17", optional: true},
      {:phoenix, ">= 1.7.0", optional: true},
      {:phoenix_live_view, ">= 0.20.0", optional: true}
    ]
  end
end
