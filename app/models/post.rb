class Post < ApplicationRecord
	belongs_to :product
	belong_to :user
	has_many :comments
	validates :name, presence: true, length:{ minimum: 2 }
	validates :content, presence: true, length:{ minimum: 5 }
end
