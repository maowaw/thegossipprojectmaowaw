class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :gossip

	has_many :likes

#Pour permettre le commentaire de commentaires on rajoute :
  belongs_to :commentable, polymorphic: true, optional: true


end
