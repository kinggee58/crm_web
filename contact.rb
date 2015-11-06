class Contact

	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes

	@@contacts = []
	@@id = 1000
	
	def initialize(first_name, last_name, options ={})
		@first_name = first_name
		@last_name = last_name
		@email = options[:email]
		@notes = options[:notes]
		@id = @@id
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

	def self.find(num_id)
		@@contacts.find {|contact| contact.id == num_id}
	end

	def remove
		@@contacts.delete_if { |contact| contact.id ==self.id}
	end
end
