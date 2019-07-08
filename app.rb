# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Contact < ActiveRecord::Base
  self.table_name = 'salesforcesandboxfull.contact'
end

class Idea < ActiveRecord::Base
  self.table_name = 'salesforcesandboxfull.idea'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end

get "/ideas" do
  @ideas = Idea.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
