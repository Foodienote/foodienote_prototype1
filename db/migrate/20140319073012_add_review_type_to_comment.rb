class AddReviewTypeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :review_type, :string
  end
end
