class Comment < ApplicationRecord
	belong_to :user
	belong_to :post
	has_many :replies
	validates :content, presence: true, length:{ minimum: 1 }
end
