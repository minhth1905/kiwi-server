class Rate < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :user
end
