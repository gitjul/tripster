class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :as => :imageable, :dependent => :destroy
  has_many :points, :dependent => :destroy
  accepts_nested_attributes_for :points, :allow_destroy => true

  validates :name, :presence => true
  validates :description, :presence => true

  attr_accessible :name, :description, :points_attributes
end

