class User < ActiveRecord::Base
  has_and_belongs_to_many :Event
  has_many :DinnerLike
  has_many :User, :through => :DinnerLike
end
