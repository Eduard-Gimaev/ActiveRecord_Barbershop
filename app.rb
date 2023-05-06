#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}


class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3}
	validates :phone, presence: true
	validates :datetime, presence: true
	validates :color, presence: true
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
	@c = Client.new
	erb :visit
end  

post '/visit' do
	@c = Client.new params[:client]
	if @c.save
		erb "Thanks. You've been enrolled now"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end  

get '/visitors' do
	@clients = Client.all
	erb :visitors
  end

  get '/barber/:id/' do
	@barber = Barber.find(params[:id])
	erb  :barber
  end

  get '/visitor/:id' do
	@visitor = Client.find(params[:id])
	erb :client
  end