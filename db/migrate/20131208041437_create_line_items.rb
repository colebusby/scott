class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id, :cart_id, :quantity

      t.timestamps
    end
  end
end
