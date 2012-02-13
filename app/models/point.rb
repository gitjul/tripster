class Point < ActiveRecord::Base
  belongs_to :trip

  validates :name, :presence => true
  validates :lat, :lng, :presence => true

  attr_accessible :name, :description, :lat, :lng
end

