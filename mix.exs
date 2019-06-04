defmodule Exexec.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :exexec,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      dialyzer: [
        flags: [:error_handling, :race_conditions, :underspecs, :unknown, :unmatched_returns],
        plt_add_deps: :project,
        plt_add_apps: [:erlexec]
      ],
      source_url: "https://github.com/antipax/exexec",
      docs: [
        main: "Exexec",
        extras: ["README.md"],
        source_ref: "v#{@version}"
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  def application do
    [included_applications: [:erlexec]]
  end

  defp deps do
    [
      {:erlexec, "~> 1.9"},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.3.2", only: :dev},
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:excoveralls, "~> 0.11.1", only: :test},
      {:inch_ex, "~> 2.0.0", only: :docs}
    ]
  end

  defp description do
    "An idiomatic Elixir wrapper for erlexec."
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Eric Entin"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/antipax/exexec"
      }
    ]
  end
end
