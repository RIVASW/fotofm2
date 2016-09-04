class CreateGalleryResult
	attr_reader :section, :gallery, :error_message

	def self.create_successfull_result(section, gallery)
		CreateGalleryResult.new(section, gallery, true)
	end

	def self.create_failed_result(section, gallery, error_message)
		CreateGalleryResult.new(section, gallery, false, error_message)
	end

	def create_initial_result(section, gallery)
		CreateGalleryResult.new(section, gallery, false)
	end

	def initialize(section, gallery, created_succesfully, error_message = '')
		@section = section
		@gallery = gallery
		@created_succesfully = created_succesfully
		@error_message = error_message
	end

	def created_succesfully?
		@created_succesfully
	end
end