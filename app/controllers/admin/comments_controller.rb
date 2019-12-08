class Admin::CommentsController < Admin::BaseController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @comments = Comment.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @comment = Comment.new
    @posts = Post.all
    @users = User.all
  end

  # GET /posts/1/edit
  def edit
  	@posts = Post.all
    @users = User.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @comment = Comment.new(comment_params)
     
      if @comment.save
         redirect_to admin_comments_path(@comment)
      else
        render :new , errors: @comment.errors.messages.slice

    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @comment.update(comment_params)
        redirect_to admin_comments_path(@comment)
      else
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comment.destroy
     redirect_to admin_comments_path(@comment)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :post_id, :user_id)
    end