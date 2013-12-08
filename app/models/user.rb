class User < ActiveRecord::Base
  has_many :orders

  has_secure_password validations: false

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: {within: 6..40}, confirmation: true

end