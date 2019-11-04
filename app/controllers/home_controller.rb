class HomeController < ApplicationController
  
  def welcome

		puts "$" * 60
	  puts "Voici le message de l'URL :"
		puts params[:name]                                         

  end
end
