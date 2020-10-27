audio_emitter_position(myemitter,x,y,0);

if(place_empty(x,y) == false)
{
	if(audio_is_playing(se_excrametion) == false) and count = 0
	{
		scr_sound_save(600,id,"alert",x,y);
		audio_play_sound_on(myemitter,se_excrametion,false,1);
		count++;
	}
}
else count = 0;