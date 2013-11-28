json.array!(@cheeses) do |cheese|
  json.extract! cheese, :name
  json.url cheese_url(cheese, format: :json)
end
