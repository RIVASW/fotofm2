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
		@section = Section.find(params[:section_id])
		@gallery = @section.galleries.build(gallery_params)
		respond_to do |format|
			if@gallery.save
				format.html{ redirect_to edit_admin_section_path(@section.id), notice: 'gallery was successfully created.' }
			else
				format.html{ render action: 'new' }
			end
		end
	end

	def destroy
			@gallery.destroy
			respond_to do |format|
				format.html { redirect_to admin_gallerys_path }
			end
		end

	def thumbnail
		send_data @gallery.thumbnail
	end  	

private

	def set_gallery
		@gallery = Gallery.find(params[:id])
	end

	def gallery_params
		params.require(:gallery).permit(:name, :title, :thumbnail, :date)
	end 	
end