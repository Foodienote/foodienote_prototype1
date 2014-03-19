class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :locu_id
      t.string :name
      t.text :description
      t.decimal :price, :precision => 10, :scale => 2
      t.decimal :rating, :precision => 10, :scale => 1
      t.references :restaurant

      t.timestamps
    end

    add_index :menu_items, :restaurant_id
  end
end
