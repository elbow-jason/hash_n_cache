defmodule HashNCache.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hash_n_cache,
      version: "0.0.2",
      elixir:  "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:         deps,
      package:      package,
      description:  description,
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :logger
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    A simple utility to hash an erlang term, and cache the term in ETS with
    the hash as the key and the term as the value.
    """
  end

  defp package do
    [
      files:        ["lib", "mix.exs", "README*", "license*"],
      maintainers:  ["Jason Goldberger"],
      licenses:     ["MIT"],
      links:        %{"GitHub" => "https://github.com/elbow-jason/hash_n_cache"}
    ]
  end

end
