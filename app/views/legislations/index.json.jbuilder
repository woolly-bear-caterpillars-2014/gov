json.array!(@legislations) do |legislation|
  json.extract! legislation, :id, :title, :proposal_date, :publication_date, :congress_voting_date, :senate_voting_date, :president_signing_date, :abstract, :url, :type
  json.url legislation_url(legislation, format: :json)
end
