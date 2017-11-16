class StaticPagesController < ApplicationController

	def index
  	#@products = Product.all
	end

  def landing_page
    @products = Product.limit(3)
	end

	def contact
	end

	def about
	end

	def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
  	flash[:notice] = "Mail sent successfully!"
  	redirect_to intro_path
	end


end
