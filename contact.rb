class Contact

	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes

	@@contacts = []
	@@id = 1

	def initialize(first_name, last_name, options ={})
		@id = @@id
		@first_name = first_name
		@last_name = last_name
		@email = options[:email]
		@notes = options[:notes]

		@@id += 1

	end

	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options)
		@@contacts << new_contact
	end

	def self.all 
		@@contacts
	end

	def contact_info
		puts "#{first_name}, #{last_name}, #{email}, #{notes}"
	end

	def self.choose_contact(id)
		@@contacts.each do |contact|
			if id == contact.id
				return contact
			end
		end
	end
end

jon = Contact.new("Jon", "Greenspan", email: "jgreenspan10@gmail.com", notes: "dude")

jon.contact_info