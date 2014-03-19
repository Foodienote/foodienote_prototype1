class Restaurant < ActiveRecord::Base
  has_many :menu_items

  def isDuplicate
  	restaurant = Restaurant.where(:locu_id => self.locu_id)
	if restaurant.count == 0
		return false
	else
		return true
	end
  end

  def self.getVenueFromLocu(locuID)
	venueSearchResult = HTTParty.get("https://api.locu.com/v1_0/venue/" + locuID + "/?api_key=007462acbbeebff0b661f26e36a26eef5eff36c4")
	venue = venueSearchResult["objects"][0]
	return venue;
  end

end
