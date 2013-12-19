class RemoveColumns < ActiveRecord::Migration
  def change
  remove_column :user_sports, :from
  remove_column :user_sports, :until
  remove_column :user_sports, :daypart
  remove_column :availables, :start_at
  remove_column :availables, :end_at
  drop_table :user_availables
  end

  
end
