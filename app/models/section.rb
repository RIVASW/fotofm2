class Section < ActiveRecord::Base
	validates :name, uniqueness: { case_sensitive: false }
	validates :name, :title, presence: true
	has_many :galleries, dependent: :destroy	
end
