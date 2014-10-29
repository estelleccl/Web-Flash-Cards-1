class CreateDecksTable < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title, null:false, index: true
      t.string :author
      
      t.timestamps
    end 
  end
end