class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [ :edit, :update, :destroy ]
  def index
    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path , notice: "Product created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity , notice: "Product updated successfully"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path , alert: "Product deleted successfully"
  end

  private
  def product_params
    params.require(:product).permit(:name, :sku, :price, :stock_quantity, :description, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
