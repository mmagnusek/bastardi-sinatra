var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-15759162-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

function recordOutboundLink(category, action) {
  try {
    var pageTracker=_gat._getTracker("UA-15759162-1");
    pageTracker._trackEvent(category, action);
  }catch(err){}
}

$(document).ready(function() {
  
  setInterval("checkAnchor()", 300);  

  $('.slideshow').cycle({
		fx: 'fade',
		timeout: 10000
	});
  $(".lavaLamp").lavaLamp({ fx: "backout", speed: 700 });
  $f("audio", "http://releases.flowplayer.org/swf/flowplayer-3.2.3.swf", {
    //http://releases.flowplayer.org/swf/
    clip: {
      onBeforeFinish: function() {
        return false; 
      }
    },
    
  	onLoad: function(){
      this.setVolume(50)
	  }
  });
  
  $("#o_filmu_link").attr('href',"#o_filmu");
  $("#herci_link").attr('href',"#herci");
  $("#z_nataceni_link").attr('href',"#z_nataceni");
  $("#tvurci_link").attr('href',"#tvurci");
  $("#partneri_link").attr('href',"#partneri");
  $("#spoty_link").attr('href',"#spoty");
  $("#aktuality_link").attr('href',"#aktuality");
  $("#promitani_link").attr('href',"#promitani");
  
  $(".flash").fadeOut(3000);
});

$(window).load(function () {
  var width = document.body.offsetWidth;
  var height = document.body.scrollHeight;
  var shiftWidth = 0;
  var shiftHeight = 50;
  
  if( width < 1200) shiftWidth = (1200 - width) / 2;  
  
  window.scroll(shiftWidth,shiftHeight);
});

var currentAnchor = null;

function checkAnchor(){
	//Check if it has changes
	if(currentAnchor != document.location.hash){
		currentAnchor = document.location.hash;
		//if there is not anchor, the loads the default section
		if(currentAnchor) {
		  query = currentAnchor.substring(1);

      $.ajax({
        url: '/' + query + '.html',
        success: function(data) {
          changePageTitle(query);
          $(this).parent().addClass('back');
          $('#content-text').fadeOut(500, function(){
            $('#content-background').fadeIn();
            $('#content-text').html(data);
            $('#content-text').fadeIn(500);
            $(".actorPhoto").hide();
            $(".slideshow").show();
          });
          recordOutboundLink(query,query);
        }
      });
    }
	}
}

function changePageTitle(page_name){
  switch(page_name){
    case 'o_filmu':
      document.title = "Bastardi - Informace o novém českém filmu";
      break;
    case 'herci':
      document.title = "Bastardi - Film, ve kterém hraje mnoho známých herců";
      break;
    case 'z_nataceni':
      document.title = "Bastardi - Fotografie z natáčení";
      break;
    case 'tvurci':
      document.title = "Bastardi - Tvůrci českého filmu";
      break;
    case 'partneri':
      document.title = "Bastardi - Naši partneři";
      break;
    case 'spoty':
      document.title = "Bastardi - Krátká videa s herci";
      break;
    case 'promitani':
      document.title = "Bastardi - Kina kde promítáme";
      break;
    case 'facebook':
      document.title = "Bastardi - Přidejte se mezi fanoušky stránky na facebooku";
      break;
    default :
      document.title = "Bastardi - Nový český film z prostředí praktického školství";
  }
}

function removeContent(){
  $('#content-background').fadeOut(500);
  $('li.back').fadeOut(200);
  $(".actorPhoto").hide();
  $(".slideshow").show();
  //lavaLamp.removeCurr();
}
function playMusic(){
  $f().play();
}
function stopMusic(){
  $f().stop()
}