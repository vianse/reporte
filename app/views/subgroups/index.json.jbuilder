json.array!(@subgroups) do |subgroup|
  json.extract! subgroup, :id, :name, :group_id, :subgroup_id
  json.url subgroup_url(subgroup, format: :json)
end
