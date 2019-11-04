class CitiesController < ApplicationController

	def index

	end



	def show
		
	#on selectionne le user qui correspond au nom envoyé en cliquant sur le lien dans gossip
		@city = City.find(params["id"])
	end



	def new
		@city = City.new	
	end



	def create


	end


	def edit
	 
	end



	def update
	  
	end





end
