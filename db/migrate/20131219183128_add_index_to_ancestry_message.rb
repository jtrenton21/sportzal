class AddIndexToAncestryMessage < ActiveRecord::Migration
  def change
  	add_index :messages, :ancestry
  end
end
