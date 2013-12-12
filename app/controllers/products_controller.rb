class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    product = Product.new(product_param)
    if product.save
      flash[:success] = "#{product.name} has been added"
      redirect_to add_new_treat_path
    else
      flash[:error] = "Could not add treat, check entries and try again."
      render 'new'
    end
  end

  private

  def product_param
    params.require(:product).permit!
  end
end