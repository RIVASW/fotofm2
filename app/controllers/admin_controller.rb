class AdminController < ApplicationController
	layout 'admin'
	before_action :require_login

private
	def require_login
		unless logged_in?
			flash[:error] = "You must be logged in to access admin section"
			redirect_to root_path 
		end
	end

	def logged_in?
		true
	end
end