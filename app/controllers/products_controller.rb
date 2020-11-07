class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create ]

  def index
    @products = Product.includes(:images).order("created_at DESC")
    @images = Image.last(5)
    @product_lists = Product.last(5)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new 
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
  
  def destroy
    if @product.seller_id == current_user.id && @product.destroy
      redirect_to root_path
    else
      render "products/show"
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :brand, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :price, images_attributes: [:image, :_destroy, :id])
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
