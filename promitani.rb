# coding: utf-8

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'production.db'
)

class Projection < ActiveRecord::Base
  scope :today,     lambda { { :conditions => ['date == ?', Date.today] } }
  scope :tomorrow,  lambda { { :conditions => ['date == ?', Date.today + 1.day] } }
end

get '/promitani.html' do
  @today_projections    = Projection.today
  @tomorrow_projections = Projection.tomorrow
  @cinemas = Projection.find(:all, :conditions => ["date >= :today", { :today => Date.today}]).map do |projection|
    projection.location
  end.sort.uniq
  haml :promitani, :layout => @layout
end

get '/get_dates' do
  @projections = Projection.find(:all, :conditions => ["location = :location AND date >= :today", { :location => params[:cinema], :today => Date.today}])
  haml :get_dates, :layout => false
end