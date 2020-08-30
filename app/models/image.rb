class Image < ApplicationRecord
  belongs_to :estimate,optional: true
  mount_uploader :image, ImageUploader
end
