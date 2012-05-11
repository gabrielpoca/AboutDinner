class Dinner < ActiveRecord::Base
  belongs_to :event
  has_many :dinner_like
  has_many :user, :through => :dinner_like
end
