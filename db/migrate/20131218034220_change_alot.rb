class ChangeAlot < ActiveRecord::Migration
  def change
  	remove_column :user_sports, :available_id
  	add_column :availables, :user_sport_id, :integer
  end
  
end
