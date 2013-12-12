class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = params[:amount]
    # require 'pry'; binding.pry
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )
    flash[:success] = "Your order has been processed. Thank you for your business"
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to line_items_path
  end
end