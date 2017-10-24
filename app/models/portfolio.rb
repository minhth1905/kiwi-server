class Portfolio < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :contents
  has_many :rates
  has_many :comments

  mount_uploader :image, ImagesUploader
end
