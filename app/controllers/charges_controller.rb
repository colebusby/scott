class ChargesController < ApplicationController
  def new
  end

  def create
    order = Order.new(params[:order][0])
    order.email = params[:stripeEmail]
    if order.valid?
      charge_card
      order.save
      session[:cart_id] = nil
      flash[:success] = "Your order has been processed. Thank you for your business"
      redirect_to root_path
    else
      flash[:danger] = "Please check entries and try again. Your card has not been charged."
      redirect_to line_items_path
    end
  end

  def charge_card
    @amount = params[:order][0][:total]
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => params[:order][0][:description],
      :currency => 'usd'
    )
  rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to line_items_path
  end
end