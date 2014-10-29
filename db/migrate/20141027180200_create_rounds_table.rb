class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, null:false, index: true
      t.integer :num_of_tries_left, default: 3
      
      t.timestamps
    end  
  end
end