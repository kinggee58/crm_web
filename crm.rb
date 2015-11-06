require_relative 'contact'
require 'sinatra'

Contact.create("Johnny", "Bravo",email: "johnny@bitmakerlabs.com",notes: "Rockstar")
Contact.create("Rose", "Diker", email: "rose@gbc.com")
Contact.create("Mike", "Greenspan", email: "mike@uwo.ca", notes: "brother")

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.new.ctime
	erb :index	
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :contacts
	erb :new_contact
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
	redirect to ('/contacts')
end

get "/contacts/1000" do 
	@contact = Contact.find(1000)
	erb :show_contact
end

get "/contacts/:id" do
	@contact = Contact.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do 
	@contact = Contact.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end
