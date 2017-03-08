require "sinatra/base"
require "pry"
require "httparty"
require_relative "zombie"
require_relative 'intro'
require_relative 'bacon'
require_relative 'herpderp'
require_relative 'standard'

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
  output.send(paragraphs.sample)
end

get "/lorem/herpderp" do
  paragraphs = ["one", "two", "three", "four"]
  output = Herpderp.new
  output.send(paragraphs.sample)
end

get "/lorem/bacon" do
  paragraphs = ["one", "two", "three", "four"]
  output = Bacon.new
  output.send(paragraphs.sample)
end

get "/lorem/standard" do
  paragraphs = ["one", "two", "three", "four"]
  output = Standard.new
  output.send(paragraphs.sample)
end

run! if app_file == $PROGRAM_NAME
end
