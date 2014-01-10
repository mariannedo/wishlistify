class ChangeCustomeridToInteger < ActiveRecord::Migration
  def change
    change_column :users, :customer_id, :integer
  end
end