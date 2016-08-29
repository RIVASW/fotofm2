class Admin::SectionsController < AdminController
	before_action :set_section, only: [:show, :edit, :update, :destroy]

	def index
		@sections = Section.all
	end

	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		respond_to do |format|
			if@section.save
				format.html{ redirect_to admin_sections_path, notice: 'image was successfully created.' }
			else
				format.html{ render action: 'new' }
			end
		end
	end

	def update
		respond_to do |format|
			if@section.update(section_params)
				format.html{ redirect_to admin_sections_path, notice: 'image was successfully updated.' }
			else
				format.html{ render action: 'edit' }
			end
		end
	end

	def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to admin_sections_path }
    end
  end

  def edit
  	@galleries = Gallery.where("section_id = ?", @section.id)  		
  end

private

	def set_section
		@section = Section.find(params[:id])  
	end

	def section_params
			params.require(:section).permit(:name, :title)
	end 	
end