# coding: utf-8

require 'rubygems'
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/base'
require 'active_record'
require 'rack-flash'

enable :sessions
use Rack::MethodOverride
use Rack::Flash

before do
  @layout = false if request.xhr?
end

helpers do
  def title(title = nil)
    title ||= "Bastardi - Nový český film z prostředí praktického školství"
    content_for :title do
      title
    end
  end
  
  def description(description = nil)
    description ||= "Příběh z prostředí praktického školství. Bez povrchností, klišé a přetvářek."
    content_for :description do
      description
    end
  end

  def checked?(option, answer)
    'checked' if answer && option == answer
  end
end

get '/' do
  haml :index, :layout => false
end

get '/index.html' do
  haml :index, :layout => false
end

get '/web.html' do
  haml :web
end

get '/o_filmu.html' do
  haml :o_filmu, :layout => @layout
end

get '/aktuality.html' do
  haml :aktuality, :layout => @layout
end

get '/herci.html' do
  haml :herci, :layout => @layout
end

get '/partneri.html' do
  haml :partneri, :layout => @layout
end

get '/spoty.html' do
  haml :spoty, :layout => @layout
end

get '/soutez.html' do
  haml :soutez_vysledky, :layout => @layout
end

get '/tvurci.html' do
  haml :tvurci, :layout => @layout
end

get '/z_nataceni.html' do
  haml :z_nataceni, :layout => @layout
end


# load 'souteze.rb'