class Car < ActiveRecord::Base
  belongs_to :user
  has_many :parkings
end
