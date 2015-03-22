class Parking < ActiveRecord::Base
  belongs_to :user
  belongs_to :car
  belongs_to :parkdeck

  def amount
    if self.end.present?
      @parkdeck = Parkdeck.where(id: self.parkdeck_id).first
      duration = self.end - self.start
      mins = duration / 60
      if mins < 15
        amount = 0.75
        else
          quarter = mins / 15.0
          quarter.ceil.to_i
      end
    else
      return 0.75 
    end

  end

end
