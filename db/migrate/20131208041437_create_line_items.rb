class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id, :product_id, :quantity

      t.timestamps
    end
  end
end
