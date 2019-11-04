class UsersController < ApplicationController


	def index

	end



	def show
	#on selectionne le user qui correspond au nom envoyé en cliquant sur le lien dans gossip
		@user = User.find(params["id"])
	end



	def new
		@user = User.new	
	end



	def create
#ici on réceptionne les data du formulaire, envoyées par la méthode new (cf dans views)
	  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], )
	  @user.user = User.find_by(id: session[:user_id])
	  if @user.save# essaie de sauvegarder en base @user
		    # si ça marche, il redirige vers la page d'index du site
	    flash[:notice] = "Utilisateur bien créé!"
	    redirect_to gossips_path #gossips_path est l'adresse de l'index
	  else
	  	# sinon, il render la view new (qui est celle sur laquelle on est déjà)
	    render :new
	  end

	end


	def edit
	 
	end



	def update
	  
	end



end
