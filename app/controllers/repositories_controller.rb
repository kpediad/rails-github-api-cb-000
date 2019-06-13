class RepositoriesController < ApplicationController

  client_id = "dummy_id"
  client_secret = "dummy_secret"

  def index
    response = Faraday.get "https://api.github.com/user" do |req|
      req.body = { 'client_id': client_id, 'client_secret': client_secret }
      req.headers['Accept'] = 'application/json'
      req.headers['Authorization'] = session[:token]
    end
    body = JSON.parse(response.body)
    @username = body['login']
    response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.body = { 'client_id': client_id, 'client_secret': client_secret }
      req.headers['Accept'] = 'application/json'
      req.headers['Authorization'] = session[:token]
    end
    @repos = JSON.parse(response.body)
  end

end
