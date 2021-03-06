class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, null:false, index: true
      t.integer :num_of_tries_left, default: 3
      t.integer :deck_id, null:false, index: true
      t.integer :num_of_questions_left, default: 20
      
      t.timestamps
    end  
  end
end