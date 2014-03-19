class MenuItem < ActiveRecord::Base
  letsrate_rateable "taste", "quantity", "waiting_time"
  belongs_to :restaurant
  has_many :comments

  def isDuplicate
	menuItems = MenuItem.where(:locu_id => self.locu_id)
	if menuItems.count == 0
		return false
	else
		return true
	end
  end
end
