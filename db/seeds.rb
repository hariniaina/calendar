# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = %w(plinsy2@gmail.com)
passwords = %w(01111998)
print "Creating admins <"
admins.length.times do |n|
	User.create(
		email: admins[n],
		password: passwords[n],
		password_confirmation: passwords[n],
		admin: true
	)
	print "="
end
print ">\n"

print "Creating appointments <"
50.times do |n|
	if Appointment.last
		date = Appointment.last.date+3600*(1+3/4)
	else
		date = Time.now+3600*2
	end
	while !(8 <= date.hour && date.hour < 18)
		date = date + 3600*(1)
	end
	if date.saturday?
		date = date + 3600*24*2
	end
	if date.sunday?
		date = date + 3600*24*1
	end
	min = date.min.to_s[1].to_i
	if 0 < min && min < 5
		date = date - 60*min
	elsif 5 < min
		date = date + 60*(10-min)
	end
	Appointment.create(
		name: "RH#{n}",
		company: "Company#{n}",
		address: "Lot Quelque part 0#{n}bis",
		email: "rh#{n}@yopmail.com",
		tel: "01 234 56 789",
		date: date
	)
	print "."
end
print ">\n"

# def menu
# 	puts "<=== Main Menu ===> "
# 	puts " 1. add new staff\n 2. add new appointment\n 3. exit"
# 	print "> "
# 	c = gets.chomp
# end

# while menu.to_i != 3
# 	case menu.to_i
# 	when 1
# 		create_new_staff
# 		break
# 	when 2
# 		create_new_app	
# 		break
# 	end
# end

# def create_new_app
# 	print "Nom> "
# 	name = gets.chomp.to_s
# 	p
# 	print "Email> "
# 	email = gets.chomp.to_s
# 	p
# 	print "Address> "
# 	address = gets.chomp.to_s
# 	p
# 	print "Tel> "
# 	tel = gets.chomp.to_s
# 	p
# 	print "Date> "
# 	date = gets.chomp.to_s
# 	p

# 	if Appointmen.create(name: name,email: email,address: address,tel: tel,date: date)
# 		p "new appointment added."
# 	else
# 		p "error."
# 	end
# end

puts "Done"