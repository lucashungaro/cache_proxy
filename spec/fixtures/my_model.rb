class MyModel
  def my_method(options = {})
    cache_proxy("my_key", options) do
      "Expensive call"
    end
  end
end