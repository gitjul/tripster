class Point < ActiveRecord::Base
  belongs_to :trip
  has_many :pictures, :as => :imageable, :dependent => :destroy

  validates :name, :presence => true
  validates :lat, :lng, :presence => true

  attr_accessible :name, :description, :lat, :lng
end

