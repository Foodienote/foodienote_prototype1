class WelcomeController < ApplicationController
  def index
	  @query = params['query']
	  @zipcode = params['zipcode']
	  if @query.nil? || @query == ""
		  @query = '';
		  @restaurants = []
		  return
	  end
	  if @zipcode.nil?
	  	@zipcode = '';
	  end

	  search_condition = "%" + @query + "%"
	  zipcode_condition = @zipcode
	  zipcode_condition.gsub! 'Current Location - ', ''
	  @restaurants = Restaurant.find(:all, :conditions => ['name LIKE ? AND postal_code = ?', search_condition, zipcode_condition]);
  end
end
