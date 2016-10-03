class Movie < ActiveRecord::Base
#validates :title, presence: true, length: { minimum: 3, maximum: 50}
#validates :description, presence: true, length: {minimim: 10, maximum: 2000 }
#validates :user_id, presence: true
 
	belongs_to :user
	belongs_to :category
  has_many :reviews
	acts_as_votable
	

	has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	scope :by_user, lambda { |user| where(:user_id => user.id)  }

	scope :high_rate, -> { where('rating >= ?', 5) }
	scope :action, -> { where(category_id: Category.find_by_name("Action").id) }

	
	scope :title, -> (title) { where title: title }
	scope :search, -> (title) { where("title like ?", "#{title}%")}
end

