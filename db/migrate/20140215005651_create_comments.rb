class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.datetime :date_created
      t.datetime :date_modified
      t.references :user
      t.references :menu_item

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :menu_item_id
  end
end
