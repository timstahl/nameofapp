class StaticPagesController < ApplicationController

	def index
  	#@products = Product.all
	end

  def landing_page
    @products = Product.limit(4)
	end

	def contact
	end

	def about
	end

end
