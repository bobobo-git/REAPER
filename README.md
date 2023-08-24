4 [REAPER](https://reaper.fm/) ![REAPER](pics/REAPERlogo.png)

-------
Renaming Childtracks --> ParentTrackname_ChildTrackname   (20180917)  
the brutal way, these two (same code, different names) renames selected
tracks : results in *foldername_trackname* , it renames all selected tracks  
[!renchildtoparent.eel](scripts/!renchildtoparent.eel)  
[!bobobo_rename_child_track_append_parent.eel](scripts/!bobobo_rename_child_track_append_parent.eel)  

------

this renames selected tracks and renames like above only if the track is not a folder itself  
[!bobobo_rename_child_track_append_parent_if_not_parent.eel](scripts/!bobobo_rename_child_track_append_parent_if_not_parent.eel)  

------

this unmutes the first track and set transport to run  
or mutes the first track an set transport to stop  

[!bobobo_runstop_play.lua](scripts/!bobobo_runstop_play.lua)  


-------
JSFX
controlling something with midi  
<pre>
desc:cc volslider
//bobobo:2022 jan 25
//this sends a midi volumechange when the slider is changed
slider1:0<0,127,1>cc 7 midi vol (0-127)
@init
ccold;
cc;
shot=0;
@slider
cc=slider1;
ccold !== cc?( ccold=cc; shot=1;):(shot=0);
@block
shot==1?( midisend(0,  0xB0,7,slider1));
</pre>
-------
<a name="controlling InputFX from TrackFX"></a>
someone had problems controlling input volume via envelope (an input fx has not too much connections to the REAPERs guts)  
i made a controller script to deal with this (I salute the FX Builder of the original script)  
you get a volume slider in a trackFX , controlling a slider in InpputFX as well.  

[read here](cifftf.md)  

-------
i freed the SLAX from SonicAnomaly from functions  
and duplicated a dialbutton to 8 of them (value1 to value8)  
  
as there is no real function but it is graphically responding  
you can do some parameter-modulation with other effects  
  
it uses the slax_gfx, so it's best to put it into the same folder  
as the Original SLAX ([reapack](https://reapack.com/) is obligate here  
and [SonicAnomaly's repository](https://github.com/Sonic-Anomaly/Sonic-Anomaly-JSFX/raw/master/index.xml)


All credits to [SonicAnomaly](https://sonic.supermaailma.net/plugins)

- [8 Knobs](scripts/8 Knobs.jsfx)

-----------  
LOSERs saturation js
enhanced with a volume slider to calm it (volume stolen from COCKOS volpansmoother  
- [Saturation vol](scripts/Saturation vol)  


or another one, somehow simpler but more complex  
 - [--!--sat_with input_output](scripts/--!--sat_with input_output)  

----------- 
#nailthem  
if you are in urge to fix the trackenvelopes height you can use  
[this lua-script](scripts/bobobo_nail the track envelopes heights.lua)

Mousewheel with CTRL on TCP in/decreases all including the trackenvelopes  
running the script before nails the track envelope height so to envelope won't change in height while mousewheel+CTRL on TCP  

-----------  
sometimes it can happen that items will overlap or covered  
the chatgpt has known a solution as scripts , get them and load them in REAPER  
[show covered items](scripts/bobobo_show_doubles.lua)  
[show overkapping intems](scripts/bobobo_show_overlapping.lua)  


-----------  


[here](VP/README.md) you find a little tweak for the Virtual Playing from [Paul Battersby](http://virtualplaying.com/about/)  <small>[(obey licensing)](http://virtualplaying.com/virtual-playing-orchestra/#licensing)</small> 

---------------
AKAIMidiMix at your hand and don't know what to do with it?  
Look at the [AkaiMidiMixDubVersion](https://bobobo-git.github.io/AkaiMidiMixDubVersion/)

---------------

[videoprozessor stuff](videoprocessor/list.md)

---------------

<a href="https://bobobo-git.github.io/REAPER/">site</a><a style="float:right;" href="https://github.com/bobobo-git/REAPER/">.</a>
