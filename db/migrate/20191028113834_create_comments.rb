class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content

      t.belongs_to :user
      t.belongs_to :gossip

#Pour permettre le commentaire de commentaire
      t.integer :commentable_id, optional: true
      t.string :commentable_type

      t.timestamps
    end
  end
end
