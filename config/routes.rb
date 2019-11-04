Rails.application.routes.draw do

#créé les 7 chemins REST pour gossip
	resources :gossips , :shallow => true do 
  	resources :comments
	end

	#créé les 7 chemins REST
	resources :comments

#créé les 7 chemins REST pour user, sauf le destroy, pour l'entité User
	resources :users, except: [:destroy] 

#créé seulement la route show pour les villes
	resources :cities, only: [:show]



#créé 3 chemins pour sessions
	resources :sessions, only: [:new, :create, :destroy]

#page d'accueil statique
  get 'home', to: 'static_pages#home'

#rails avait généré automatiquement "get 'home/welcome'", on change l'adresse pour une route dynamique mais on renvoit tjrs à la méthode welcome
  get 'home/:name', to: 'home#welcome'

#après avoir créé le controller team, on écrit ici : get URL to: controllervisé#méthodevisée
	get 'team', to: 'static_pages#team'

	get 'contact', to: 'static_pages#contact'
 



# DEPUIS QU'ON A MIS RESOURCES, ON N'A PLUS BESOIN DE CES COMMANDES INDIVIDUELLES

#afficher un user (méthode qu'on retrouvera dans gossips)  
#get '/:user', to: 'gossips#user'

#afficher un potin  
#  get 'gossips/:id', to: 'gossips#show'


end
