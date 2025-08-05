defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    language_list = ["Clojure", "Haskell", "Erlang", "Elixir", "F#"]
    Enum.any?(list, fn x -> Enum.member?(language_list, x) end)
  end
end
