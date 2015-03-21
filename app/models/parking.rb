class Parking < ActiveRecord::Base
  belongs_to :user
  belongs_to :car
  belongs_to :parkdeck
end
