class Product < ApplicationRecord
	validates :name, presence: true
	has_many :comments
	has_many :orders

	def self.search(search_term)
		like_string = Rails.env.production? ? "ilike" : "LIKE"
		Product.where("name #{like_string} ?", "%#{search_term}%")
	end

	def highest_rating_comment
  	comments.rating_desc.first
	end
	
	def average_rating
  	comments.average(:rating).to_f
	end

	def set_latest_reviewer(user_name)
		$redis.set("lr_product:#{id}","#{user_name}")
	end

  def get_latest_reviewer
    $redis.get("lr_product:#{id}") # this returns the user's first name...
  end

  #def views
  #  $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  #end

  #def viewed!
  #  $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  #end	
	

end
