$(document).ready(function() {
  var height = document.body.scrollHeight;
  var top_margin = (height/2) - 180;
  flowplayer("player", "http://releases.flowplayer.org/swf/flowplayer-3.2.3.swf",{
    plugins: {
      controls: {
        backgroundGradient: 'none',
        backgroundColor: 'rgba(0, 0, 0, 0)',
        fullscreenOnly: false,
        time: false,
        mute: false
      }
    },
    clip: {
      onFinish: function(){
        self.location.href = 'web.html';
      }
    },
    onLoad: function(){
      this.setVolume(50);
    }
  });
  $('#player').css('margin-top',top_margin + 'px');
  $('#skip_intro').attr('href','web.html');
});
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-15759162-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();