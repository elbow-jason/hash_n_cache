defmodule HashNCache do

  def new_cache(cache_name) when cache_name |> is_atom do
    :ets.new(cache_name, [:set, :public, :named_table])
  end

  def insert(cache_name, key, value) do
    :ets.insert_new(cache_name, {key, value})
  end

  def get(cache_name, key) do
    case :ets.lookup(cache_name, key) do
      [{^key, value}] -> {:ok, value} # only good for :set caches
      []              -> {:error, :not_found}
      _               -> {:error, :unexpected_error}
    end
  end

  def delete(cache_name, key) do
    :ets.delete(cache_name, key)
  end

  def hash(thing) do
    :crypto.hash(:md5, "#{inspect thing}")
    |> :base64.encode
  end

  def hash_n_cache(cache_name, value) do
    key = value |> hash
    insert(cache_name, key, value)
    key
  end

end
