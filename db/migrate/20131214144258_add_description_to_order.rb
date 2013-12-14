class AddDescriptionToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :description, :string
    add_column :orders, :total, :integer
  end
end
