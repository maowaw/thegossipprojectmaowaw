class Gossip < ApplicationRecord

#Infos sur les attributes indépendants :

	validates :title,
		presence: true,
		length: { in: 3..14 }

	validates :content,
		presence: true

#Infos sur les liens avec les autres classes 

	has_many :join_gossip_tags
	has_many :tags, through: :join_gossip_tags

	has_many :comments, as: :commentable #on rajoute le as::commentable pour permettre le commentaire de commentaires
	has_many :likes

	belongs_to :user

end
