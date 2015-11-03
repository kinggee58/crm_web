require_relative 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	erb :index	
end

get '/contacts' do
	Contact.create("Jon", "Greenspan", email: "jgreenspan@gmail.com", notes: "developer")
	Contact.create("Rose", "Diker", email: "rdiker@hotmail.com", notes: "gf")
	Contact.create("Mina", "Mikhail", email: "mina@bitmaker.com", notes: "instructor")

	erb :contacts
end

get '/contacts/new' do
	erb :contacts
	erb :new_contact
end

