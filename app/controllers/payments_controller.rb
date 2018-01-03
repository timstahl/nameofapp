class PaymentsController < ApplicationController



 def create
 		@product = Product.find(params[:product_id])
    @user = current_user


  	token = params[:stripeToken]

  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      amount: (@product.price).to_i,
      currency: "usd",
      source: token,
      description: params[:stripeEmail]

    )

    if charge.paid
      Order.create(
        product_id: @product.id, 
        user_id: @user.id, 
        total: @product.id.to_i)
      #UserMailer.order_placed(@user, @product).deliver_now
    end


  rescue Stripe::CardError => e
    # The card has been declined
  end
  redirect_to product_path(@product)
  end


end
