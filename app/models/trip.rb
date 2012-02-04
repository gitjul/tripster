class Trip < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => true
  validates :description, :presence => true

  attr_accessible :name, :description
end
