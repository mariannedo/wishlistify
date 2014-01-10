class CreateUsersProducts < ActiveRecord::Migration
  def change
    create_table :users_products do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
