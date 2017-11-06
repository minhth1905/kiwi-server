json.code 1
json.message "success"
json.data @portfolios do |portfolio|
  json.id portfolio.id
  json.name portfolio.name
  json.image portfolio.image
  json.owner do
    json.full_name portfolio.user.full_name
    json.id portfolio.user.id
  end
  json.category do
    json.name portfolio.category.name
    json.id portfolio.category.id
  end
  json.like portfolio.like
  json.view portfolio.view
end
