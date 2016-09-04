class  CreateGallery
	def initialize(params)
		@params = params
		@section = Section.find(@params[:section_id])
		@gallery = @section.galleries.build(gallery_params)
	end

	def create_gallery			
		unless @gallery.save				
				message = 'Error while saveing gallery'
				Rails.logger.error message
				return CreateGalleryResult.create_failed_result(@section, @gallery, message)			
		end		
		@params[:gallery][:images].each do |image_params| 
			image = @gallery.images.build(file: image_params)			
			save_result = image.save
			unless save_result
				@gallery = @gallery.destroy
				message = 'Error while saveing images'
				Rails.logger.error message
				return CreateGalleryResult.create_failed_result(@section, @gallery, message)
			end					
		end	
		CreateGalleryResult.create_successfull_result(@section, @gallery)
	end

private

	def gallery_params
		@params.require(:gallery).permit(:name, :title, :thumbnail, :date)
	end 	

end