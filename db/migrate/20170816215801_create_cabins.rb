class CreateCabins < ActiveRecord::Migration[5.1]
  def change
    create_table :cabins do |t|
      t.string :room, null: false
      t.integer :level, null: false
      t.boolean :is_available, default: true
      t.belongs_to :ship, index: true, null: false
      t.timestamps
    end

    add_foreign_key :cabins, :ships
    add_index :cabins, [:room, :level, :ship_id], unique: true
  end
end
