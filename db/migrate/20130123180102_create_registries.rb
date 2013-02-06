class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.references :room
      t.references :booking
      t.datetime :entry
      t.datetime :exit
      t.string :client
      t.string :phone
      t.string :obs

      t.timestamps
    end
    add_index :registries, :room_id
    add_index :registries, :booking_id
  end
end
