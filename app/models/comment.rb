class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
<<<<<<< HEAD
end
=======

  scope :rating_desc, -> { order(rating: :desc) }

  scope :rating_asc, -> { order(rating: :asc) }

end


>>>>>>> 1c4992f307477a2a4c37133f097c64b9113fa76f
