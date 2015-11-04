require_relative 'contact'
require 'sinatra'

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
