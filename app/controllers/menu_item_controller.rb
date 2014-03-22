class MenuItemController < ApplicationController
	def new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@menu_item = @restaurant.menu_items.create(params[:menu_item]).permit(menu_item_params)
	end
	
	def index
	end

	def show
		@menu_item = MenuItem.find(params[:id])
		@restaurant = Restaurant.find(@menu_item.restaurant_id)
		@review_type = params[:review_type]
		if @review_type.nil?
			@review_type = "all"
		end
		@reviewtype_index = params[:index]
		if @reviewtype_index.nil?
			@reviewtype_index = "0";
		end
	end

	def update
		review_type = params[:menu_item][:review_types]
		if review_type.nil?
			#redirect_to menu_item_path(@menu_item)
		end
		@menu_item = MenuItem.find(params[:id])
		if @menu_item.review_types.nil?
			@menu_item.review_types = review_type
		else
			@menu_item.review_types += "," + review_type
		end
		@menu_item.save;
		redirect_to menu_item_path(@menu_item)
	end

	private
	def menu_item_params
		params.require(:menu_item).permit(:locu_id, :name, :description,:price, :restaurant_id)
	end
end
