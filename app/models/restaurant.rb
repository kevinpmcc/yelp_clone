class Restaurant < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :reviews,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy
  belongs_to :user
  validates :name, length: {minimum: 3}, uniqueness: true

  def belongs_to_user?(restaurant, user)
    restaurant.user_id == user.id
  end

end
