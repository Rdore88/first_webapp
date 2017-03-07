require "sinatra/base"
require "pry"
require "httparty"
require_relative "zombie"
require_relative 'intro'
require_relative 'bacon'

class ServerApp < Sinatra::Base

get "/" do
  Intro.general
end

get "/billy" do
  result = params["name"]
  Intro.custom(result)
end

get "/lorem/zombie" do
  paragraphs = ["one", "two", "three"]
  output = Zombie.new
  output.send((paragraphs.sample))
end

get "/lorem/herpderp" do
  body(Herpderp.herpderp)
end

get "/lorem/bacon" do
  number_paragraphs = params["paragraphs"].to_i
  output = Bacon.new
  body(output.to_print(number_paragraphs))
end

get "/lorem/standard" do
  body(Ipsum.standard)
end

run! if app_file == $PROGRAM_NAME
end
