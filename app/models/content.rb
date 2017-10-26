class Content < ActiveRecord::Base
  belongs_to :portfolio
  enum typee: {image: 0, video: 1}
  # mount_uploader :link, ImagesUploader
end
