class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :room
      t.datetime :entry
      t.datetime :exit
      t.string :client
      t.string :phone
      t.string :obs

      t.timestamps
    end
    add_index :bookings, :room_id
  end
end
