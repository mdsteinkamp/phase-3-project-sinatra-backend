class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/clients" do
    clients = Client.all
    clients.to_json
  end

end
