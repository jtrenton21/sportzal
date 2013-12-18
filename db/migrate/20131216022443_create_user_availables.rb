class CreateUserAvailables < ActiveRecord::Migration
  def change
    create_table :user_availables do |t|
      t.references :user
      t.references :available
      t.time :from
      t.time :until
      t.timestamps
    end
    add_index :user_availables, :user_id
    add_index :user_availables, :available_id
  end
end
