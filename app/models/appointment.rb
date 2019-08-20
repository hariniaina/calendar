class Appointment < ApplicationRecord
	after_create :send_to_staff, :send_to_visitor

	validates_uniqueness_of :date

	def send_to_staff
		AppointmentsMailer.snew_app_email(self).deliver_now
	end

	def send_to_visitor
		AppointmentsMailer.vnew_app_email(self).deliver_now
	end
end
