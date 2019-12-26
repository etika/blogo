class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    ROLES = %w[admin moderator author banned].freeze
  has_many :comments
  has_many :posts, :through => :comments  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
