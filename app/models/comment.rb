class Comment < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :user
end
