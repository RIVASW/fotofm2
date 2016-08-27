class SectionsController < ApplicationController

	def index
		@sections = Section.all
	end

	def show
		@section = Section.find(params[:id]) or not_found
	end

private
	
	def not_found
	  raise ActionController::RoutingError.new('Not Found')
	end	

end
