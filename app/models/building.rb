class Building < ActiveRecord::Base
  has_many :floors
  attr_accessible :name
end
