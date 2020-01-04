class Post < ApplicationRecord
  extend FriendlyId
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  friendly_id :title, use: :slugged
  validates_presence_of :title,:body
  scope :active, ->() { where(status: true) }
  scope :inactive, ->() { where(status: false) }
end
