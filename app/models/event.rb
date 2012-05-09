class Event < ActiveRecord::Base
  validates :name, :presence => 'true'
  has_many :EventUser
  has_many :User, :through => :EventUser
end
