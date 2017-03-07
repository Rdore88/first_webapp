require "sinatra/base"
require "pry"
require "httparty"

class ServerApp < Sinatra::Base

get "/" do
  "Hello, welcome to my website!"
end

get "/billy/"do
  result = params["name"]
  "Hello #{result}! Welcome to my website!"
end

run! if app_file == $PROGRAM_NAME
end
