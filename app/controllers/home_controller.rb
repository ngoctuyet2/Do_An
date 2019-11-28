class HomeController < ApplicationController
	def indexproduct
		@products = Product.all
	end
end
