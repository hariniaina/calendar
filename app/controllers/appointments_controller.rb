class AppointmentsController < InheritedResources::Base

	before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update, :destroy]

	include AppointmentsHelper

	def show
		@appointment = Appointment.find(params[:id])
	end

	def create
		@appointment = Appointment.new(appointment_params)

		@appointment.date = free_time

		if @appointment.save
			respond_to do |format|
				format.html { 
					redirect_to '/', 
					notice: "Nous sommes en train de traiter votre demande, un email de confirmation vous sera bientôt envoyé" 
				}
			end
		else
			respond_to do |format|
				format.html { 
					redirect_to new_appointments_path, 
					alert: @appointment.errors.full_messages 
				}
			end
		end
	end

	def update
		@appointment = Appointment.find(params[:id])
		if @appointment.update(params.require(:appointment).permit(:date, :m3)) && free(@appointment.date)
			respond_to do |format|
				format.html { 
					redirect_to "/appointments/#{@appointment.id}/edit",
					notice: "Modification réussi!" 
				}
			end
		else
			respond_to do |format|
				format.html { 
					redirect_to "/appointments/#{@appointment.id}/edit", 
					alert: "Cette date est déjà prise ou n'est pas raisonnable, veuillez en choisir une autre" 
				}
			end
		end
	end

	def sender
		@appointment = Appointment.find(params[:id])
		if confirm(@appointment)
			@appointment.update(is_accepted?: true)
			respond_to do |format|
				format.html { 
					redirect_to "/appointments/#{@appointment.id}/edit", 
					notice: "l'email a été envoyé à <#{@appointment.email}>"
				}
			end
		else
			respond_to do |format|
				format.html { 
					render :edit, 
					alert: "Email non envoyé."
				}
			end
		end
	end
end

