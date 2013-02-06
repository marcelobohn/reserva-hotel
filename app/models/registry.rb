class Registry < ActiveRecord::Base
  belongs_to :room
  belongs_to :booking
  attr_accessible :client, :entry, :exit, :obs, :phone, :room_id, :booking_id
end
