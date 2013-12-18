class AddToAvailables < ActiveRecord::Migration
  def up
  	add_column :availables, :daypart, :string
  end

  def down
  	remove_column :availables, :daypart
  end
end
