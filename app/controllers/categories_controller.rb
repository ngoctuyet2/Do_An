class CategoriesController < ApplicationController
	def show
		@category = Category.all
		@product = Product.all
	end
end