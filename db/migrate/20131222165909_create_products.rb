class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.string :price
      t.boolean :track_quantity
      t.integer :quantity
      t.integer :variant_id

      t.timestamps
    end

    create_table :users_products do |t|
      t.belongs_to :user
      t.belongs_to :product
    end
  end
end
