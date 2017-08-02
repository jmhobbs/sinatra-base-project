require "sinatra"
require "sinatra/json"
require "sinatra/namespace"
require "./models/init"

set :sessions, key: "cookie.monster",
               secret: ENV.fetch("COOKIE_SECRET")

set :erb, format: :html5, layout: :layout

helpers do
  def slugify(string)
    string.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")
  end
end

get "/" do
  erb :index
end
