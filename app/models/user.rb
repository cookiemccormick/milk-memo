class User < ActiveRecord::Base
  has_one :baby
  has_many :medicines
  has_many :notes
  has_many :appointments

  has_secure_password
  validates_presence_of :username, :password, :email
end