class Content < ActiveRecord::Base
  belongs_to :portfolio
  mount_uploader :link, ImagesUploader
end
