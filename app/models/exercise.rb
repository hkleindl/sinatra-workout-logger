class Exercise < ActiveRecord::Base
  has_many_and_belongs_to :workouts
  belongs_to :user
end
