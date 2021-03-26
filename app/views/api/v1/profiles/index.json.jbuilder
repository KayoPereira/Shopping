json.array! @profiles do |profile|
  json.extract! profile, :name, :id
end