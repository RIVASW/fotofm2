class Admin::SectionsController < AdminController
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
	def destroy
		@section = Section.find(params[:id])
	    @section.destroy
	    respond_to do |format|
	      format.html { redirect_to admin_sections_path }
    end
  end

private
	
	def section_params
		params.require(:section).permit(:name, :title)
	end	
end