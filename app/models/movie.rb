class Movie < ActiveRecord::Base
validates :title, presence: true, length: { minimum: 3, maximum: 50}
validates :description, presence: true, length: {minimim: 10, maximum: 2000 }
validates :user_id, presence: true
 
	belongs_to :user
	belongs_to :category
  has_many :reviews
	acts_as_votable

	has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end

