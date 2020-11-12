class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @products = Product.includes(:images).order("created_at DESC").limit(5)
  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.images.build
    else
      redirect_to new_user_session_path
    end
  end

  def get_category_children
    category = Category.find(params[:parent_id])
    @category_children = category.children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.build
      render :new 
    end
  end

  def show
    @parents = Category.all.order("id ASC").limit(733)
    @nickname = current_user.nickname
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
    params.require(:product).permit(:name, :brand, :explanation, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :price, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
