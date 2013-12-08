class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :description, :image_url
      t.integer :price

      t.timestamps
    end
  end
end
