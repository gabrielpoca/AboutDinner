class EventUser < ActiveRecord::Base
  belongs_to :Event
  belongs_to :User
end
