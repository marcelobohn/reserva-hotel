class CreateTypeRooms < ActiveRecord::Migration
  def change
    create_table :type_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
