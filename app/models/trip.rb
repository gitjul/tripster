class Trip < ActiveRecord::Base
  belongs_to :user

  has_many :points
  accepts_nested_attributes_for :points

  validates :name, :presence => true
  validates :description, :presence => true

  attr_accessible :name, :description, :points_attributes
end
