class AddStartAndEndOnBooking < ActiveRecord::Migration
  def up
    add_column :bookings, :start_at, :datetime
    add_column :bookings, :end_at, :datetime
  end

  def down
    remove_column :bookings, :start_at
    remove_column :bookings, :end_at
  end
end
