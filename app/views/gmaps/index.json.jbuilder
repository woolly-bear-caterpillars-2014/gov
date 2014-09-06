json.array!(@gmaps) do |gmap|
  json.extract! gmap, :id
  json.url gmap_url(gmap, format: :json)
end
