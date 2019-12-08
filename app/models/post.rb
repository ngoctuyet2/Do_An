class Post < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  belongs_to :product
  validates_uniqueness_of :product_id
end
