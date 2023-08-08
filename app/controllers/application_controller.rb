require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/clients" do
    clients = Client.all.order("last_name")
    clients.to_json(include: :policies)
  end

  delete "/clients/:id" do
    client = Client.find(params[:id])
    client.delete_all_policies
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

  delete '/policies/:id' do
    policy = Policy.find(params[:id])
    policy.destroy
    policy.to_json
  end

end
