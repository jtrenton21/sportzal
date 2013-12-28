class AddColumnUserSports < ActiveRecord::Migration
  def up
  	add_column :user_sports, :hidden, :boolean, :default => true
  end

  def down
  	remove_column :user_sports, :hidden
  end
end
