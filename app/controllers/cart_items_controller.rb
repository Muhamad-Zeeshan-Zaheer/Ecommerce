class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart || current_user.create_cart

    product = Product.find(params[:product_id])

    item = cart.cart_items.find_by(product_id: product.id)

    if item
      item.quantity += 1
      item.save
    else
      cart.cart_items.create(product: product, quantity: 1)
    end

    redirect_to cart_path, notice: "Product added to cart!"
  end
end
