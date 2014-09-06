json.array!(@congress_people) do |congress_person|
  json.extract! congress_person, :id
  json.url congress_person_url(congress_person, format: :json)
end
