class Image < ActiveRecord::Base
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
