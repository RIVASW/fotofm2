class Image < ActiveRecord::Base
	validates :filename, :mime_type, :file_contents, :gallery_id, presence: true
	belongs_to :gllerey
	
	def initialize(params = {})
	  	@file = params.delete(:file)
	  	super
	  	if @file
	    	self.filename = filename_wo_path(@file.original_filename)
	    	self.mime_type = @file.content_type
	    	self.file_contents = @file.read
		end
	end
private
	def filename_wo_path(filename)
		return File.basename(filename)
	end
end
