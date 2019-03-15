class User < ActiveRecord::Base
  has_one :baby, dependent: :destroy
  has_many :medicines, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :appointments, dependent: :destroy

  has_secure_password
  validates_presence_of :username, :email

  def self.username_taken?(username)
    find_by(username: username)
  end
end