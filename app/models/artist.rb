class Artist < ActiveRecord::Base
	has_many :movies
end
