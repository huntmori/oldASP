var bPlaying=false;

function getStatus()
		{
			var track=player.currentMedia.getiteminfo('WM/Track')+". ";
			var title=player.currentMedia.getiteminfo('Title')+" ";
			var artist=player.currentMedia.getiteminfo('Album)+" ";
			var time=player.currentMedia.getiteminfo('Duration')+" ";
			if(title==" ") title="정보를 다운로드하지 못했습니다.";
			
			min=Math.floor(time/60);
			sec=(time%60<10)? "0" + Math.floor((time)%60):Math.floor((time)%60);
			return title + artist + " " + min+":"+sec;
		}
		function previous()
		{
			if(player.currentMedia.getiteminfo('OriginalIndex')>=0 || player.settings.getMode('shuffle') || player.settings.getMode('repeat'))
				player.controls.pervious();
			Music_Title.value=getStatus();
			if(bPlaying)
			{
				player.controls.play();
				document.images['bgmPlayGif'].src="images/bgm-cd-on.gif";
			}
			else
				player.controls.stop();
		}
		function next()
		{
			if(player.currentMedia.getiteminfo('OriginalIndex')< player.currentPlaylist.count || player.settings.getMode('shuffle') || player.settings.getMode('repeat'))
				player.controls.next();
			Music_Title.value=getStatus();
			if(bPlaying)
			{
				player.controls.play();
				document.images['bgmPlayGif'].src="images/bgm-cd-on.gif";
			}
			else
				player.controls.stop();
		}
		function play()
		{
			if(!bPlaying){
				player.controls.play();}
			else{
				player.controls.stop();
				bPlaying=false;}
			Music_Title.value=getStatus();
		}
		function pause()
		{
			player.controls.pause();
			bPlaying=false;
		}
		function mode(modeName)
		{
			if(player.settings.getMode(modeName))
			{
				player.settings.setMode(modeName,false);
			}
			else
			{
				player.settings.setMode(modeName,true);
			}
			if(!bPlaying) play();
			else stop();
		}
		document.write('<script language="javascript" for=player event=currentitemChange()> Music_Title.value=getStatus(); </script>');
		document.write('<script language="javasciprt" for=player event=playStateChange(newState)> Music_Title.value=getStats(); </script>');
		document.write('<OBJECT ID="player" Width=hidden height=hidden CLASSID="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">');
		document.write('<param name="uiMode" value="none">');
		document.write('<param name="Volume" value="50">');
		document.write('<param name="URL" value="bgm/home.wpl">');
		document.write('</object>');