class CommentsController < ApplicationController


#telles que doivent être toutes les def de la classe comment, en mode REST
	def index
		# Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
	#on récupère les infos du formulaire de la méthode create
	
	#Comment.create(params[:title, :content])
	end



	def show
		# Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
	#on selectionne le comment qui correspond à l'id rentré dans l'adresse (params{"id"})
		@comment = Comment.find(params["id"])
	end



	def new
		@comment = Comment.new
	end



	def create
	  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
	  # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
	  # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
	
  #ici on réceptionne les data du formulaire, envoyées par la méthode new (cf dans views)
	 
  	@gossip = Gossip.find(params[:comment][:id]) #on récup l'id du gossip en question
  
	  @comment = @gossip.comments.new(user_id: session[:user_id], content: params[:comment][:content], gossip_id: @gossip.id) # avec xxx qui sont les données obtenues à partir du formulaire

	  puts "$" * 80
 		puts @gossip.id
 			 puts "$" * 80
 		puts @comment.content
 			  puts "$" * 80


	  #@comment.gossip_id = params[:gossip_id]
	  if @comment.save # essaie de sauvegarder en base @comment
	    # si ça marche, il redirige vers la page du gossip
	    flash[:notice] = 'Gossip bien commenté'
	    redirect_to gossip_path(@gossip.id) #on redirige sur la page du gossip

	  else
	    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
	  	flash[:notice] = "Vous devez être connecté.e pour commenter !"
	  	redirect_to gossip_path(@gossip.id)
  	end
	end


	def edit
	  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
	#on veut juste retrouver le bon potin, comme dans show!	
		@comment = Comment.find(params["id"])

	end



	def update
	  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
	  # pour info, le contenu de ce formulaire sera accessible dans le hash params
	  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

	  @comment = Comment.find(params[:id])
	  if @comment.update(content:params[:content])
	    redirect_to gossip_path(@comment.gossip_id)
	  else
	    render :edit
	  end
	end


	def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Commentaire bien supprimé modafuck'
    redirect_to gossip_path(@comment.gossip_id)

	end


end


