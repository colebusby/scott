class Order < ActiveRecord::Base
  belongs_to :user
  has_one :cart

  validates :name, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :email, presence: true
  validates :description, presence: true
  validates :total, presence: true
end