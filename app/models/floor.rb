class Floor < ActiveRecord::Base
  belongs_to :buildings
  has_many :rooms  
  attr_accessible :building_id, :name
end
