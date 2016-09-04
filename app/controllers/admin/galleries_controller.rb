class Admin::GalleriesController < AdminController
	before_action :set_gallery, only: [:show, :edit, :update, :destroy, :thumbnail]

	def index
		@galleries = Gallery.all
	end

	def new
		@section = Section.find(params[:section_id])
		@gallery = @section.galleries.build		
	end

	def create
		respond_to do |format|
			@creator = CreateGallery.new(params)
			result = @creator.create_gallery
			update_state(result)
			if(result.created_succesfully?)
				format.html{ redirect_to edit_admin_section_path(@section), notice: 'gallery was successfully created.' }
			else
				format.html{ render action: 'new' }
			end
		end
	end

	def destroy
		@section_id = @gallery.section_id
		@gallery.destroy
		respond_to do |format|
			format.html { redirect_to edit_admin_section_path(@section_id), notice: 'gallery was successfully deleted.' }
		end
	end

	def thumbnail
		send_data @gallery.thumbnail
	end  	

private
	def update_state(state_holder)
		@section = state_holder.section
		@gallery = state_holder.gallery
	end

	def set_gallery
		@gallery = Gallery.find(params[:id])
	end
end