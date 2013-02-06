class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :floor
      t.references :type_room
      t.boolean :air_conditioning
      t.integer :beds

      t.timestamps
    end
    add_index :rooms, :floor_id
    add_index :rooms, :type_room_id
  end
end
