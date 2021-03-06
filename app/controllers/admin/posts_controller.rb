class Admin::PostsController < Admin::BaseController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(["name LIKE ?","%#{params[:search]}%"])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @products = Product.all
    @users = User.all
  end

  # GET /posts/1/edit
  def edit
  	@products = Product.all
    @users = User.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
     
      if @post.save
         redirect_to admin_posts_path(@post)
      else
        render :new , errors: @post.errors.messages.slice

    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        redirect_to admin_posts_path(@post)
      else
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
     redirect_to admin_posts_path(@post)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, :product_id, :user_id)
    end