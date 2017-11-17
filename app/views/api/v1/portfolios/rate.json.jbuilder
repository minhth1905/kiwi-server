json.code 1
json.message "success"
json.data @rates do |rate|
  json.id rate.id
  json.username rate.user.username
  json.full_name rate.user.full_name
  json.rateStar rate.number
  json.msg rate.description
end
json.count @rates.length
