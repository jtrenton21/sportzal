class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :ancestry

      t.timestamps
    end
  end
end
