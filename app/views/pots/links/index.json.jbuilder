json.array!(@links) do |link|
  json.extract! link, :name, :url, :references, :references, :already_shared
  json.url link_url(link, format: :json)
end