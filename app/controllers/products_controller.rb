class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create_comment
	# before_action :authenticate_user! , only: :create_comment
	def index
		

		#@products = Product.paginate(page: params[:page],per_page: 8)
		@products = Product.where(["name LIKE ?","%#{params[:search]}%"])
		#@products = Product.search(params[:product])
  		#@serach = @product.result.includes(:articles).page(params[:page])
	end

	def show
		@product = Product.find(params[:id])
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


	def create_reply
		if current_user.nil?
			render :json => {success: false}
		else
			reply = Reply.new(user_id: current_user.id, comment_id: params[:comment_id], content: params[:content])
			render :json => {success: reply.save}
		end
	end
	def get_reply
		number = params[:number] || 0
		obj = []
		replies = Reply.where(comment_id: params[:comment_id]).last(number)
		replies.each do |f|
			obj << {content: f.content, email: f.user.email}
		end
		render :json => {replies: obj}
	end
end
end