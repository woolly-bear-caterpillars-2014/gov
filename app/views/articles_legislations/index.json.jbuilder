json.array!(@articles_legislations) do |articles_legislation|
  json.extract! articles_legislation, :id, :references, :references
  json.url articles_legislation_url(articles_legislation, format: :json)
end
