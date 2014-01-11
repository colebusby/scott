class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.order(:id).where(cart_id: current_cart.try(:id))
  end

  def create
    check_for_cart
    product = Product.find(params[:line_items].first["product_id"].to_i)
    quantity = params[:line_items].first["quantity"].to_i

    line_item = LineItem.new(cart_id: current_cart.id, product_id: product.id, quantity: quantity)
    if valid_quantity(quantity) && line_item.save
      flash[:success] = "#{quantity} order(s) of #{product.name} have been added to your cart."
      redirect_to products_path
    else
      flash[:error] = "Could not add #{product.name} to cart."
      redirect_to products_path
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])
    line_item.destroy
    redirect_to line_items_path
  end

  def update_line_item
    begin
      ActiveRecord::Base.transaction do
        params[:line_items].each do |line_item_data|
          line_item = LineItem.find(line_item_data["id"])
          quantity = line_item_data["quantity"].to_i
          line_item.update_attribute(:quantity, quantity) if valid_quantity(quantity)
        end
      end
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Please enter a value between 1-99"
    end

    redirect_to line_items_path
  end

  def check_for_cart
    unless cart_made?
      cart = Cart.create
      session[:cart_id] = cart.id
    end
  end

  def valid_quantity(quantity)
    if quantity.is_a?(Integer) == false
      return false
    elsif quantity < 1
      return false
    elsif quantity > 99
      return false
    else
      return true
    end
  end
end