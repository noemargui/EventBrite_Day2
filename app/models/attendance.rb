class Attendance < ApplicationRecord
  after_create :newattendee_send

# les associations
  belongs_to :attendee, class_name: "User"
  belongs_to :event

# le mailing
  def newattendee_send #Envoie d'un email au créateur de l'événement quand qqn participe à son event
    AdminMailer.newattendee_email(self).deliver_now
  end

end
