class RestaurantController < ApplicationController
	def new
	end

	def create
		@restaurant = Restaurant.new(restauarant_params)
	end

	def index
		@restaurants = Restaurant.all
		@query = params[:query]
		url = "https://api.locu.com/v2/venue/search"
		@response = HTTParty.post(url,
			     :body => { :api_key => "007462acbbeebff0b661f26e36a26eef5eff36c4", "venue_queries" => [{:name => @query}]}.to_json,
			     :headers => { 'Content-Type' => 'application/json' })
		
	end
	
	def show
		@restaurant = Restaurant.find(params[:id])
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:locu_id, :name)
	end
end
