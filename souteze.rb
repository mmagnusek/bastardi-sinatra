ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :database =>  'bastardi',
  :username => 'root',
  :password => '',
  :socket => '/opt/local/var/run/mysql5/mysqld.sock',
  :encoding => 'utf8'
)

class Answer < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :message
  
  default_scope :order => 'created_at DESC'

  named_scope :unread, :conditions => { :points => nil }, :order => 'created_at DESC'
end

put '/soutez/new' do
  @answer = Answer.new(params[:answer])
  if @answer.save
    redirect '/soutez.html'
  else
    haml :soutez, :layout => @layout  
  end
end

get '/admin/answers' do
  @answers = Answer.unread
  haml :"admin/answers/index", :layout => :admin
end

delete '/admin/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/admin/answers'
end

get '/admin/answers/:id' do
  @answer = Answer.find(params[:id])
  haml :"admin/answers/show", :layout => :admin
end

put '/admin/answers/:id/update_points' do
  @answer = Answer.find(params[:id])
  @answer.update_attributes(:points => params[:points])
  redirect '/admin/answers'
end