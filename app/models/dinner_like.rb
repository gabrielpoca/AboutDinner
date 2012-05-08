class DinnerLike < ActiveRecord::Base
  belongs_to :Dinner
  belongs_to :User
end
