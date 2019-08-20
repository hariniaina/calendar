module AppointmentsHelper
	def appointment_params
    params.require(:appointment).permit(:name, :company, :address, :email, :tel)
  end
  
  def free_time
  	if Appointment.all.any?
	  	appointments = []
	  	Appointment.all.each do |appointment|
	  		appointments << appointment if between_start_and_end(appointment) && free(appointment.date)
	  	end
	  	if appointments.any?
	  		return appointments.last.date+3600*(1+3/4)
	  	else
	  		return Appointment.last.date+3600*(1+3/4)
	  	end
	  else
  		return params[:appointment][:start_date]+3600*(1+3/4)  # 1h45mn after the suggestion
  	end
  end

  def free(date)
	return !date.saturday? && !date.sunday? && (8 <= date.hour && date.hour < 18)
  end

  def between_start_and_end(appointment)
  	return params[:appointment][:start_date] <= appointment.date && appointment.date <= params[:appointment][:end_date]
  end

	def confirm(appointment)
		AppointmentsMailer.edited_app_email(appointment).deliver_now
	end
	
 	# def send_to_visitor
	# 	AppointmentsMailer.edited_app_email(self).deliver_now
	# end

	# def re_send_to_visitor
	# 	AppointmentsMailer.re_edited_app_email(self).deliver_now
	# end

	# def re_send_to_staff
	# 	AppointmentsMailer.re_new_app_email(self).deliver_now
	# end

end
