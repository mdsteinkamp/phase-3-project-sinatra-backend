require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/clients" do
    clients = Client.all.order("last_name")
    clients.to_json(include: :policies)
  end

  get "/clients/:id" do
    policy = Client.find(params[:id])
    policy.to_json
  end

  delete "/clients/:id" do
    client = Client.find(params[:id])
    client.destroy
    client.to_json
  end

  post '/clients' do
    client = Client.create(
      last_name: params[:last_name],
      first_name: params[:first_name],
      date_of_birth: params[:date_of_birth],
      state: params[:state],
      spouse_name: params[:spouse_name],
    )
    client.to_json(include: :policies)
  end

  post '/policies' do
    policy = Policy.create(
      carrier: params[:carrier],
      product: params[:product],
      policy_date: params[:policy_date],
      policy_number: params[:policy_number],
      face_amount: params[:face_amount],
      conversion_expiry: params[:conversion_expiry],
      purpose: params[:purpose],
      rate_class: params[:rate_class],
      client_id: params[:client_id],
      status: params[:status],
    )
    policy.to_json
  end

  patch '/policies/:id' do
    policy = Policy.find(params[:id])
    policy.update(
      carrier: params[:carrier],
      product: params[:product],
      policy_date: params[:policy_date],
      policy_number: params[:policy_number],
      face_amount: params[:face_amount],
      conversion_expiry: params[:conversion_expiry],
      purpose: params[:purpose],
      rate_class: params[:rate_class],
      client_id: params[:client_id],
      status: params[:status],
    )
    policy.to_json
  end

  get '/insurancetotal' do
    total = Policy.sum(:face_amount)
    total.to_json
  end

end
