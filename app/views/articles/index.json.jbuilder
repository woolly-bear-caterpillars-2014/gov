json.array!(@articles) do |article|
  json.extract! article, :id, :title, :first_paragraph, :publication_date, :url, :source
  json.url article_url(article, format: :json)
end
