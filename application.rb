require 'rubygems'
require 'sinatra'

before do
  @layout = false if request.xhr?
end

helpers do
  def title
    @title ||= "Bastardi - Nový český film z prostředí praktického školství"
  end
  
  def description
    @description ||= "Příběh z prostředí praktického školství. Bez povrchností, klišé a přetvářek."
  end
end

get '/' do
  @description = "Přijďte do kina na nový český film, který zobrazuje reálnou situaci v českém praktickém školství."
  haml :index, :layout => false
end

get '/index.html' do
  @description = "Přijďte do kina na nový český film, který zobrazuje reálnou situaci v českém praktickém školství."
  haml :index, :layout => false
end

get '/web.html' do
  haml :web
end

get '/o_filmu.html' do
  @title = "Bastardi - Informace o novém českém filmu"
  @description = "Film vychází z autorova dlouholetého působení v základním školství, kde čerpal inspiraci pro drsný příběh o dětech ze sociálně vyloučených lokalit. Film pojednává o brutální vraždě mladé praktikantky, kterou mají na svědomí právě tři chlapci z jedné základní školy."
  haml :o_filmu, :layout => @layout
end

get '/aktuality.html' do
  @title = "Bastardi - Přidejte se mezi fanoušky stránky na facebooku"
  @description = "Přidejte se mezi mnoho našich fanoušků na facebooku a sledujte novinky, zákulisní informace a fotografie z natáčení přímo na vašem facebooku. Komentujte fotky a události a staňte se součástí Bastardů."
  haml :aktuality, :layout => @layout
end

get '/herci.html' do
  @title = "Bastardi - Film, ve kterém hraje mnoho známých herců"
  @description = "Přijďte se podívat na známé tváře. Ve filmu hrají Ladislav Potměšil, Kristýna Leichtová, Alexand Hemala, Saša Rašilov, Tomáš Magnusek, Jan Přeučil a další."
  haml :herci, :layout => @layout
end

get '/sponzori.html' do
  @title = "Bastardi - Naši sponzoři"
  @description = "Děkujeme všem sponzorům. Mezi nimi patrí STEF recycling, Batist, Bronas, CDS, Tyros Loading Systems, Hašpl, Mary Kay, Nail tek, Kadeřnictví Butik U bílé vrány, Primátor, Potraviny Verner, Stavis a další."
  haml :sponzori, :layout => @layout
end

get '/spoty.html' do
  @title = "Bastardi - Krátká videa s herci"
  @description = "Devět ukázek s devíti herci v novém českém filmu Bastardi. Mrkni na video s Ladislavem Potměšilem, Janem Šťastným nebo Davidem Dolanským."
  haml :spoty, :layout => @layout
end

get '/tvurci.html' do
  @title = "Bastardi - Tvůrci českého filmu"
  @description = "Tomáš Magnusek, Petr Šícha, Jan Lengyel, Antonín Žovinec, Ivana Buková"
  haml :tvurci, :layout => @layout
end

get '/z_nataceni.html' do
  @title = "Bastardi - Fotografie z natáčení"
  @description = "Podívejte se na fotografie vzniklé při natáčení nového českého filmu Bastardi."
  haml :z_nataceni, :layout => @layout
end