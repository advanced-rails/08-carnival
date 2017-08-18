class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.string :room, null: false
      t.integer :level, null: false
      t.decimal :cost, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :cruise, index: true, null: false
      t.timestamps
    end

    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :cruises
  end
end
