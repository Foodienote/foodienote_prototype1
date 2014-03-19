class Comment < ActiveRecord::Base
  include DateTimeModule

  belongs_to :menu_item
  belongs_to :user
  has_one :rating

  def get_date_created
  	return comment_format(date_created)
  end
end
