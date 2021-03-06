class LocuDatabaseManagerController < ApplicationController
  def update_needAccount
	@response = HTTParty.post("https://api.locu.com/v2/venue/search", 
	:body =>
	{
		:api_key => "007462acbbeebff0b661f26e36a26eef5eff36c4",
		:fields => ["name", "menu_items"],
		:venue_queries => [{"location" => {"locality"=>"westfield","region"=>"nj","postal_code"=>"07090"}}]
	}.to_json,
	:headers => {'Content-Type' => 'application/json'})
#	redirect_to root_path
  end
  def update
	  response = HTTParty.get("http://api.locu.com/v1_0/menu_item/search/?locality=garwood&region=nj&postal_code=07027&api_key=007462acbbeebff0b661f26e36a26eef5eff36c4")

	      menuItems = response["objects"]
	menuItems.each do |menuItem|
		venueID = menuItem['venue']['id']
		restaurant = Restaurant.find(:first, :conditions => {'locu_id' => venueID})
		if restaurant.nil?
			venue = Restaurant.getVenueFromLocu(venueID)
			restaurant = Restaurant.create(['locu_id' => venueID, 'name' => venue['name'], 'region' => venue['region'], 'postal_code' => venue['postal_code']])
		end
		if restaurant.instance_of?(Restaurant)
			newMenuItem = MenuItem.create(['locu_id' => menuItem['id'], 'name' => menuItem['name'], 'description' => menuItem['description'], 'price' => menuItem['price'], 'restaurant_id' => restaurant.id])
		end
	end
	  
  redirect_to root_path
  end
end
