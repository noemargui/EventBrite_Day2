class UserMailer < ApplicationMailer

  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    @user = user #récupère instance user pour la passer à la view en @user

    @url  = 'http://monsite.fr/login', #définit une variable @url qu'on utilisera dans la view d’e-mail

    mail(to: @user.email, subject: 'Bienvenue chez nous !') # l'appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet
  end

end
