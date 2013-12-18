class AddColumnsToUserSport < ActiveRecord::Migration
  def change
  add_column :user_sports, :from, :time
  add_column :user_sports, :until, :time
  add_column :user_sports, :available_id, :integer
  end
end
