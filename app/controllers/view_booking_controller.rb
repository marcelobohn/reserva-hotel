class ViewBookingController < ApplicationController
	def index
		@rooms = Room.all
	    respond_to do |format|
	      format.html # index.html.erb
	    end
	end
	def busca
		#render :text => "action busca"		
	end
	def show
		render :text => "action show"		
	end

	def teste
		render :text => "action teste"		
	end

	def search
		render :text => "action search"
	end	
end
