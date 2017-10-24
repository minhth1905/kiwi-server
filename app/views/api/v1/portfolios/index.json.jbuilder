json.code 1
json.message "success"
json.data @portfolios do |portfolio|
  json.id portfolio.id
  json.owner portfolio.user.full_name
  json.category portfolio.category.name
  json.like portfolio.like
  json.view portfolio.view
end
