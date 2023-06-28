require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/clients" do
    clients = Client.all.order("last_name")
    clients.to_json
  end
  
  get "/clients/:id" do
    policy = Client.find(params[:id])
    policy.to_json(include: :policies)
  end

  post '/clients' do
    client = Client.create(
      last_name: params[:last_name],
      first_name: params[:first_name],
      date_of_birth: params[:date_of_birth],
      state: params[:state],
      spouse_name: params[:spouse_name],
    )
    client.to_json
  end

end
