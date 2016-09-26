class Review < ActiveRecord::Base
	validates :rating, presence: true
  validates :comment, presence: true, length: {minimim: 10, maximum: 2000 }

	belongs_to :movie
	belongs_to :user
end
