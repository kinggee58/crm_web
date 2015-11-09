require 'sinatra'
require 'data_mapper'
DataMapper.setup(:default, 'sqlite3:database.sqlite3')


class Contact
	include DataMapper::Resource
	attr_accessor :id, :first_name, :last_name, :email, :notes
	
	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :notes, Text
end
	DataMapper.finalize
	DataMapper.auto_upgrade!

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

put "/contacts/:id" do 
	@contact = Contact.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.notes = params[:notes]

		redirect to("/contacts")
	else 
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do 
	@contact = Contact.find(params[:id].to_i)
	if @contact
		@contact.remove
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end
