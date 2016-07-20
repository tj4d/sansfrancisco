json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :author, :description, :category, :medium, :url
  json.url publication_url(publication, format: :json)
end
