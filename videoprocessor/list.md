Some simple videoprocessor scripts  

solid color over the project space  
creating colored backgrounds 
fills the project area

<pre>
// my solid color  
// bobobo , 2022 01 10 , coloring the project space  
//@param1:R 'BG R' 1 0 1 0.5 0.01  
//@param2:G 'BG G' 1 0 1 0.5 0.01   
//@param3:B 'BG B' 1 0 1 0.5 0.01  
//@param4:A 'BG A' 1 0 1 0.5 0.01 
  
gfx_blit(0,1);  
gfx_set(R,G,B,A);  
gfx_fillrect(0,0,project_w,project_h);  
</pre>

[my solidcolor](my_solidcolor)


solid color over the project space with text (PostIt)  
colored background with text on it  
fills the project area  

<pre>
// my solid color with text (Postit)
// bobobo 2022 01 10

text="Text"; // change at will
font="Arial"; // change at will

//@param1:R 'BG R' 1 0 1 0.5 0.01
//@param2:G 'BG G' 1 0 1 0.5 0.01 
//@param3:B 'BG B' 0.7 0 1 0.5 0.01 
//@param4:A 'BG A' 1 0 1 0.5 0.01

//@param6:TS 'Text height' 0.1 0.01 0.3 0.1 0.01
//@param7:TX 'Text X' 0 0 1 0.5 0.01
//@param8:TY 'Text Y' 0 0 1 0.5 0.01

//@param10:TR 'Text R' 0.5 0 1 0.5 0.01
//@param11:TG 'Text G' 0.5 0 1 0.5 0.01
//@param12:TB 'Text B' 0.5 0 1 0.5 0.01
//@param13:TA 'Text A' 1 0 1 0.5 0.01

gfx_blit(0,1);
gfx_setfont(TS*project_h,font);
gfx_str_measure(text,TW,TH);

gfx_set(R,G,B,A);
gfx_fillrect(0,0,project_w,project_h);

gfx_set(TR,TG,TB,TA);
gfx_str_draw(text,TX*(project_w-TW),TY*(project_h-TH));
</pre>

[my solidcolor_with_text](my_solidcolor_with_text)  

<pre>
ashcat_lt
Human being with feelings
 
// ashcat_lt better cropped overlay
//@param 1:in1 'overlay (-1=next video track)' -1 -1 50 0 1
//@param 2:in2 'background (-1=second next)' -1 -1 50 0 1
//@param 3:source_L 'source Left edge' 0 0 1 0.5
//@param 4:source_R 'source Right edge' 1 0 1 0.5
//@param 5:source_T 'source Top edge' 0 0 1 0.5
//@param 6:source_B 'source Bottom edge' 1 0 1 0.5
//@param 7:dest_L 'destination Left edge' 0 0 1 0.5
//@param 8:dest_R 'destination Right edge' 1 0 1 0.5
//@param 9:dest_T 'destination Top edge' 0 0 1 0.5
//@param 10:dest_B 'destination Bottom edge' 1 0 1 0.5
//@param 11:mode 'blend mode (normal, add, difference' 0 0 2 0 1


in1 = in1== -1? input_track(0): in1;
in2 = in2== -1 ? input_track(1): in2;


source_x1 = source_L * project_w;
source_x2 = max(source_x1, source_R * project_w);
source_w = source_x2 - source_x1;
dest_x1 = dest_L * project_w;
dest_x2 = max(dest_x1, dest_R * project_w);
dest_w = dest_x2 - dest_x1;

source_y1 = source_T * project_h;
source_y2 = max(source_y1, source_B * project_h);
source_h = source_y2 - source_y1;
dest_y1 = dest_T * project_h;
dest_y2 = max(dest_y1, dest_B * project_h);
dest_h = dest_y2 - dest_y1;

mode == 2 ? mode = 19;


oldCS=colorspace;
colorspace='YV12';
gfx_set (0,0,0,1,0,-1);
gfx_fillrect (0,0,project_w,project_h);

temp = gfx_img_resize (temp,project_w,project_h);
gfx_dest = temp;
gfx_blit (in2);
gfx_mode = mode;
gfx_blit (in1,0,dest_x1,dest_y1,dest_w,dest_h,source_x1,source_y1,source_w,source_h);

gfx_mode = 0;


gfx_dest = -1;

gfx_blit(temp);

colorspace=oldCS;
</pre>
__________________

paragirafe posted some tricks
<a href"=https://forum. cockos.com/showthread.php?t=259354">Here</a>

more to come  


<a href="https://bobobo-git.github.io/REAPER/">site</a><a style="float:right;" href="https://github.com/bobobo-git/REAPER/">.</a>
