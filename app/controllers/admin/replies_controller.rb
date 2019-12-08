class Admin::RepliesController < Admin::BaseController
	before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @replies = Reply.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @reply = Reply.new
    @comments = Comment.all
    @users = User.all
  end

  # GET /posts/1/edit
  def edit
  	@comments = Comment.all
    @users = User.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @reply = Reply.new(reply_params)
     
      if @reply.save
         redirect_to admin_replies_path(@reply)
      else
        render :new , errors: @reply.errors.messages.slice

    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @reply.update(reply_params)
        redirect_to admin_replies_path(@reply)
      else
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @reply.destroy
     redirect_to admin_replies_path(@reply)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:name, :comment_id, :user_id)
    end