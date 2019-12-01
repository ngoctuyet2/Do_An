class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :name, presence: true, uniqueness: true, length:{ maximum: 28, minimum: 2 }
end
