json.array!(@skills) do |skill|
  json.extract! skill, :description
  json.url skill_url(skill, format: :json)
end
