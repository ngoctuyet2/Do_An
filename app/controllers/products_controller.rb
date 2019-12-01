class ProductsController < ApplicationController

	 before_action :set_product, only: :show
	def index
		@products = Product.paginate(page: params[:page],per_page: 8)
	end

	def show
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end
end