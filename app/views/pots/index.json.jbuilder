json.array!(@pots) do |pot|
  json.extract! pot, :name, :runevery
  json.url pot_url(pot, format: :json)
end