class Category < ActiveRecord::Base
  has_many :portfolios
  # mount_uploader :image, ImagesUploader
end
