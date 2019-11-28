class Product < ApplicationRecord
	belongs_to :category
	validates :price,presence: true, numericality:  { greater_than_or_equal_to: 0 }
	validates :description, presence: true, length:{ minimum: 2 }
	validates :name ,presence: true, length:{ minimum: 5 }
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
    # validates_attachment :image, content_type: ["image/jpeg", "image/gif", "image/png"]
end
