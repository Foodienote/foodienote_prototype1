class AddReviewTypesToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :review_types, :text
  end
end
