class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attendee_events, foreign_key: "attendee_id", class_name: "Attendance"
  has_many :events, foreign_key: 'admin_id'
  has_many :admin_events, foreign_key: "administrator_id", class_name: "Event"

  def welcome_send #methode d'envoi d'email
    UserMailer.welcome_email(self).deliver_now
  end

end
