class User < ApplicationRecord

	has_secure_password

#Infos sur les attributes indépendants :

	validates :email,
		uniqueness: true, #impossible que 2 utilisateurs rentrent le même email
		format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } #impose le format d'un email

#Infos sur les liens avec les autres classes 

	has_many :gossips
	has_many :comments
	belongs_to :city

#pour différencier le sender du recipient dans les privates messages
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

end
