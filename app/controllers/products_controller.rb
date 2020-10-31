class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order("created_at DESC")
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new unless @product.valid?
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  # def destroy
  #   @product.destroy
  #   redirect_to root_path
  # end


  private

    def product_params
      params.require(:product).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :price, images_attributes: [:image, :_destroy, :id])
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
