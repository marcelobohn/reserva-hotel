class TypeRoom < ActiveRecord::Base
  has_many :rooms
  attr_accessible :name
end
