class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :evaluates
  has_many :comments
  has_many :replies
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
	validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
   enum position: ['user', 'admin']
end
