class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null:false, unique: true, index: true
      t.string :password, null:false
      t.string :current_round
      
      t.timestamps
    end  
  end
end