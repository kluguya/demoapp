json.extract! person, :id, :firstname, :lastname, :groupname, :role, :created_at, :updated_at
json.url person_url(person, format: :json)
