class Reply < ApplicationRecord
	belong_to :comment
	belong_to :user
	validates :content, presence: true, length:{ minimum: 1 }
end
