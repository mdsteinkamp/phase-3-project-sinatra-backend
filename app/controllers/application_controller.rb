class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/clients" do
    clients = Client.all.order("last_name")
    clients.to_json
  end

  get "/policies" do
    policies = Policy.all.order("policy_date")
    policies.to_json
  end
  
  get "/clients/:id" do
    policy = Client.find(params[:id])
    policy.to_json(include: :policies)
  end

end
