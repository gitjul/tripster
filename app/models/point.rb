class Point < ActiveRecord::Base
  belongs_to :trip

  validates :name, :presence => true
  validates :description, :presence => true
end
