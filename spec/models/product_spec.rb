require 'rails_helper'

	describe Product do 
	
		context "When the product has comments" do
		
			let(:product) { Product.create!(name: "race bike") }	
			let(:user) {User.create!(first_name: "Smoky", last_name: "Bear", email: "mikesmith@gmail.com", password: "password") }


	 		before do
   			product.comments.create!(rating: 1, user: user, body: "Awful bike!")
   			product.comments.create!(rating: 3, user: user, body: "Ok bike!")
   			product.comments.create!(rating: 5, user: user, body: "Great bike!")
   		end

			it "return the average rating of all comments" do

  			expect (product.average_rating).to equal (3) 
  		
  		end

		end


			it "Testing Validations Missing The Product Name" do

      	expect(Product.new(description: "Nice bike")).not_to be_valid

    	end

    	it "Testing Validations Missing The Description" do

    		expect(Product.new(name: "race bike"))

    	end

end	
