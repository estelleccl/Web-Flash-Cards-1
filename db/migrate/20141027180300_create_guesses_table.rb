class CreateGuessesTable < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :round_id, null:false, index: true
      t.integer :card_id, null:false, index: true
      t.boolean :correct
      
      t.timestamps
    end   
  end
end