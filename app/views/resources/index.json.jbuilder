json.array!(@resources) do |resource|
  json.extract! resource, :id, :name, :category, :description, :url
  json.url resource_url(resource, format: :json)
end
