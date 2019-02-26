class User < ActiveRecord::Base
  has_many :babies
  has_many :medicines
  has_many :notes

  has_secure_password
end