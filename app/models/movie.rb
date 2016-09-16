class Movie < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	acts_as_votable

	has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
