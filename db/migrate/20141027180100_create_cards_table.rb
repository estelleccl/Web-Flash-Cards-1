class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id, null:false, index: true
      t.string :question, null:false
      t.string :answer, null:false
      
      t.timestamps
    end   
  end
end