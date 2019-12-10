class Admin::PromotionsController < Admin::BaseController
	before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @promotions = Promotion.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @promotions = Promotion.new
    @products = Product.all
  end

  # GET /posts/1/edit
  def edit
  	@products = Product.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @promotion = Promotion.new(promotion_params)
      if @promotion.save
         redirect_to admin_promotions_path(@promotion)
      else
        render :new , errors: @promotion.errors.messages.slice

    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @promotion.update(promotion_params)
        redirect_to admin_promotions_path(@promotion)
      else
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @promotion.destroy
     redirect_to admin_promotions_path(@promotion)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:name, :content, :product_id)
    end