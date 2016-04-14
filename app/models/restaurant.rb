class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, length: {minimum: 3}, uniqueness: true

  def belongs_to_user?(restaurant, user)
    restaurant.user_id == user.id
  end

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user_id
    review
  end

end
