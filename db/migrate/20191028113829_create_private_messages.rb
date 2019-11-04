class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.string :content

   #appelle des foreign key que l'on définira dans models PrivateMessage et User (qui contient sender et recipient)
      t.references :recipient, index: true
      t.references :sender, index: true      


      t.timestamps
    end
  end
end
