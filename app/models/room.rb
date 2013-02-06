class Room < ActiveRecord::Base
  belongs_to :floor
  belongs_to :type_room
  has_many :booking
  attr_accessible :air_conditioning, :beds, :name, :floor_id, :type_room_id
end
