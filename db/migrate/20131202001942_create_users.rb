class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :password_digest, :email
    end
  end
end
