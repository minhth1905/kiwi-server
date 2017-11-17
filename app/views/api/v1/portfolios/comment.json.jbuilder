json.code 1
json.message "success"
json.data @comments do |comment|
  json.id comment.id
  json.username comment.user.username
  json.full_name comment.user.full_name
  json.msg comment.content
end
json.count @comments.length
