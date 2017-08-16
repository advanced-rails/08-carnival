class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.string :name, null: false
      t.string :photo
      t.timestamps
    end

    add_index :ships, [:name], unique: true
  end
end
