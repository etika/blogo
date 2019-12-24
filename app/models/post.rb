class Post < ApplicationRecord
  extend FriendlyId
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  friendly_id :title, use: :slugged
end
