class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def product_name
    product = Product.find(self.product_id)
    product.name
  end

  def product_price
    product = Product.find(self.product_id)
    product.price
  end
end