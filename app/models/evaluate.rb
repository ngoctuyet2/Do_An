class Evaluate < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :name, presence: true, length:{ minimum: 2 }
	validates :number_star,numericality:  { greater_than_or_equal_to: 0 }
end
