class User < ActiveRecord::Base
  has_one :baby
  has_many :medicines
  has_many :notes

  has_secure_password
end