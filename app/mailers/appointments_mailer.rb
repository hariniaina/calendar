class AppointmentsMailer < ApplicationMailer

  def snew_app_email(appointment)
    #on récupère l'instance appointment pour ensuite pouvoir la passer à la view en @appointment
    @appointment = appointment

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "http://127.0.0.1:3000"
    @edit_url = "#{@url}/appointments/#{@appointment.id}/edit"
    @index_url = "#{@url}/appointments/"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(from: @appointment.email, to: 'saynamadagascar@sayna.io', subject: 'Demande de rendez-vous')
  end

  def vnew_app_email(appointment)
    #on récupère l'instance appointment pour ensuite pouvoir la passer à la view en @appointment
    @appointment = appointment

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "http://127.0.0.1:3000"
    @edit_url = "#{@url}/appointments/#{@appointment.id}/edit"
    @index_url = "#{@url}/appointments/"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @appointment.email, subject: 'Demande de rendez-vous')
  end

  def edited_app_email(appointment)
    #on récupère l'instance appointment pour ensuite pouvoir la passer à la view en @appointment
    @appointment = appointment

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = "localhost:3000/appointments/#{appointment.id}/edit"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @appointment.email, subject: 'Demande de rendez-vous bien reçue') 
  end
end