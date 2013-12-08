class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name, :address1, :address2, :city, :state
      t.integer :zip
      t.string :email, :phone
      t.boolean :open, default: true

      t.timestamps
    end
  end
end
