class Dinner < ActiveRecord::Base
  belongs_to :Event
  has_many :DinnerLike
  has_many :User, :through => :DinnerLike
end
