class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create_comment
	# before_action :authenticate_user! , only: :create_comment
	def index
		@products = Product.paginate(page: params[:page],per_page: 8)
	end

	def show
		@product = Product.find(params[:id])
	end

	def create_comment
		if current_user.nil?
			render :json => {success: false}
		else
			comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], content: params[:content])
			render :json => {success: comment.save}
		end
	end

	def get_comment
		number = params[:number] || 0
		obj = []
		comments = Comment.where(post_id: params[:post_id]).last(number)
		comments.each do |f|
			obj << {content: f.content, email: f.user.email}
		end
		render :json => {comments: obj}
	end
	
end