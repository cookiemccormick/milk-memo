class User < ActiveRecord::Base
  has_one :baby, dependent: :destroy
  has_many :medicines, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :appointments, dependent: :destroy

  has_secure_password
  validates_presence_of :username, :email, :password

  def self.username_taken?(username)
    find_by(username: username)
  end

  def future_appointments
    appointments.where("date > :today", {today: Date.today})
  end
end