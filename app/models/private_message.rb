class PrivateMessage < ApplicationRecord

#différencier sender et recipient /!\ il faut aussi ajouter des choses dans la classe user
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

end
