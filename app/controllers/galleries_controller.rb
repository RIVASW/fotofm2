class GalleriesController < ApplicationController
	before_action :set_gallery, only: [:show, :thumbnail]

	def index
		@galleries = Gallery.all
	end

	def thumbnail
		send_data @gallery.thumbnail
	end

	def show
		@images = Image.where("gallery_id = ?", @gallery.id)
	end  	

private
	def set_gallery
		@gallery = Gallery.find(params[:id])
	end

	def gallery_params
		params.require(:gallery).permit(:name, :title, :thumbnail, :date)
	end 	
end