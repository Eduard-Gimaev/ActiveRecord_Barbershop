#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}


class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
	@visitors = Client.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end  

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:colorpicker]

	Client.create :name => @username
	Client.create :phone => @phone
	Client.create :datetime => @datetime
	Client.create :barber => @barber
	Client.create :color => @color


	erb "You has been enrolled, please check your data"
end  

get '/visitors' do
	erb :visitors
  end
