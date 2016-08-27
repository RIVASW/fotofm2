class Gallery < ActiveRecord::Base
	validates :name, uniqueness: { case_sensitive: false, scope: :section_id }
	validates :name, :title, :date, :thumbnail, :section_id, presence: true
	has_many :images, dependent: :destroy
	belongs_to :section_id
end
