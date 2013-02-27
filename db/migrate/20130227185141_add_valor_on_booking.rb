class AddValorOnBooking < ActiveRecord::Migration
  def up
    add_column :bookings, :value_entry, :decimal, :precision => 8, :scale => 2
  end

  def down
    remove_column :bookings, :value_entry
  end
end
