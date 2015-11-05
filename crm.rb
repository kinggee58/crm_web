require_relative 'contact'
require 'sinatra'

Contact.create("Johnny", "Bravo",email: "johnny@bitmakerlabs.com",notes: "Rockstar")

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
