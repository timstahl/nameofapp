class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
<<<<<<< HEAD
=======

>>>>>>> e9375193fcc9b43b93ea2c21a0a6b8aad6cc686c

  scope :rating_desc, -> { order(rating: :desc) }

  scope :rating_asc, -> { order(rating: :asc) }

end


