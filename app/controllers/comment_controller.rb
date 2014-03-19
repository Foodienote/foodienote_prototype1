class CommentController < ApplicationController
	#before_action :authenticate_user!
	def new
	end

	def create
		@menu_item = MenuItem.find_by_locu_id(params[:menu_item_id])
		@params = params[:comment]	
		@params.each do |key, value|	
			@comment = @menu_item.comments.build({:review_type=>key, :body=>value})
			@comment.date_created = DateTime.now
			#@comment.user = current_user
			@comment.save
		end
		redirect_to menu_item_path(@menu_item)
	end

	def destroy
		@menu_item = MenuItem.find(params[:menu_item_id])
		@comment = @menu_item.comments.find(params[:id])
		@comment.destroy
		redirect_to restaurant_menu_item_path(@menu_item)
	end

	private
	def comments_param
		params[:comment].permit(:body)
	end
end
