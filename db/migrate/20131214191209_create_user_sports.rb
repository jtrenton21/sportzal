class CreateUserSports < ActiveRecord::Migration
  def change
    create_table :user_sports do |t|
      t.references :user
      t.references :sport
      t.string :experience
      t.string :skill_level

      t.timestamps
    end
    add_index :user_sports, :user_id
    add_index :user_sports, :sport_id
  end
end
