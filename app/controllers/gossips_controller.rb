class GossipsController < ApplicationController


#telles que doivent être toutes les def de la classe gossip, en mode REST
	def index
		# Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
	end



	def show
		# Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
	#on selectionne le gossip qui correspond à l'id rentré dans l'adresse (params{"id"})
		@gossip = Gossip.find(params["id"])
		@comment = Comment.new


	#test count = Comment.find_by(gossip_id: params["id"])
	end



	def new
	  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
		@gossip = Gossip.new	
	end



	def create
	  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
	  # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
	  # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
	
  #ici on réceptionne les data du formulaire, envoyées par la méthode new (cf dans views)
	  @gossip = Gossip.create(user_id: params[:user_id], title: params[:title], content: params[:content])
	  @gossip.user = User.find_by(id: session[:user_id])
	  if @gossip.save# essaie de sauvegarder en base @gossip
		    # si ça marche, il redirige vers la page d'index du site
	    flash[:notice] = "Potin bien créé !"
	    redirect_to gossips_path #gossips_path est l'adresse de l'index
	  else
	  	# sinon, il render la view new (qui est celle sur laquelle on est déjà)
	    render :new
	  end
	end


	def edit
	  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
	#on veut juste retrouver le bon potin, comme dans show!	
		@gossip = Gossip.find(params["id"])

	end



	def update
	  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
	  # pour info, le contenu de ce formulaire sera accessible dans le hash params
	  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

	  @gossip = Gossip.find(params[:id])
	  if @gossip.update(title:params[:title], content:params[:content])
	    redirect_to @gossip
	  else
	    render :edit
	  end
	end


	def destroy

    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = 'Bien supprimé modafuck'
    redirect_to gossips_path

	end


end



#ça ne devrait pas être là, mais en attendant, la fiche user est là :	
	#def user
	#on selectionne le user qui correspond au nom envoyé en cliquant sur le lien dans gossip
		#@user = User.find_by(first_name: params["user"])
  #end