class Category < ApplicationRecord
	has_many :products
	validates :name, presence: true, uniqueness: true, length:{ maximum: 28, minimum: 2 }
end
