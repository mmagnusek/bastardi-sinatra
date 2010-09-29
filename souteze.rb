# coding: utf-8

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'production.db'
)

class Answer < ActiveRecord::Base
  belongs_to :district
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :email, :name, :question1, :question2, :question3, :district_id
  validates_uniqueness_of :email
  default_scope :order => 'created_at DESC'

end

class District < ActiveRecord::Base

end

get '/soutez.html' do
  @answer = Answer.new
  @districts = District.all
  haml :soutez_form, :layout => @layout
end

put '/soutez/new' do
  @answer = Answer.new(params[:answer])
  if @answer.save
    flash[:notice] = "Vaše hlasování bylo zaznamenáno. Děkujeme."
    redirect '/web.html'
  else
    @districts = District.all
    haml :soutez_form, :layout => @layout  
  end
end

# get '/admin/answers' do
#   @answers = Answer.all
#   haml :"admin/answers/index", :layout => :admin
# end
# 
# delete '/admin/answers/:id' do
#   @answer = Answer.find(params[:id])
#   @answer.destroy
#   redirect '/admin/answers'
# end
# 
# get '/admin/answers/:id' do
#   @answer = Answer.find(params[:id])
#   haml :"admin/answers/show", :layout => :admin
# end