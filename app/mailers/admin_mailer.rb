class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

    def newattendee_email(attendance)
      @admin = attendance.event.admin
      @event = attendance.event
      @attendee = attendance.attendee
      @url  = "http://monsite.fr/login" #définit une variable @url qu'on utilisera dans la view d’e-mail
      mail(to: @admin.email, subject: "#{@attendee.first_name} #{@attendee.last_name} s'est inscrit à ton super event.") # l'appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet
    end
end