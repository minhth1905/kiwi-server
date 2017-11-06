json.code 1
json.message "success"
json.data @portfolios do |portfolio|
  json.id portfolio.id
  json.name portfolio.name
  json.image portfolio.image
  json.owner do
    json.full_name portfolio.user.full_name rescue nil
    json.id portfolio.user.id rescue nil
  end
  json.category do
    json.name portfolio.category.name rescue nil
    json.id portfolio.category.id rescue nil
  end
  json.like portfolio.like
  json.view portfolio.view
end
