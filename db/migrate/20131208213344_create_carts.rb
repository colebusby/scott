class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :order_id
    end
  end
end
