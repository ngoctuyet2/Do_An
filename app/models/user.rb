class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
   validates_attachment :avatar, :attachment_content_type => { :content_type => ['image/png', 'image/jpg']}
   enum position: ['user', 'admin']
end
