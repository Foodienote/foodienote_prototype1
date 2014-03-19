class SearchController < ApplicationController
	def create
		zipcode = params[:search]['zipcode']
		redirect_to restaurant_index_path(:query => params[:search]['query'], :zipcode => zipcode)
	end
end
