class Event < ActiveRecord::Base
  validates :name, :presence => 'true'
  has_many :place
  has_many :dinner
  has_many :comment
  has_many :event_user
  has_many :user, :through => :event_user
  accepts_nested_attributes_for :user, :place, :dinner, :event_user, :comment
end
