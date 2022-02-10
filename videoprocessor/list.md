![](1kl.png)  
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


solid color over the project space  
creating colored backgrounds 
fills the project area
enhanced version
- optional shadow  
- sizing
- positioning  

<pre>
// my solid color enhanced
// bobobo , 2022 01 21 , coloring the project space enh 
//@param1:R 'BG R'   1 0  1 0.5   0.01
//@param2:G 'BG G'   1 0  1 0.5   0.01 
//@param3:B 'BG B'   1 0  1 0.5   0.01 
//@param4:A 'BG A'   1 0  1 0.5   0.01
//
//
//@param6:w 'width-red' 0 0 50 0.01  0.01
//@param7:h 'height-red' 0 0 50 0.01  0.01
//
//@param9:dx 'dx' 0 -100 100 0 0.1
//@param10:dy 'dy' 0 -100 100 0 0.1
//
//@param12:s 'shadow' 0 0 1 0.5 1
//@param13:sd 'x-y shadow' 2 1 5 3 1 

h=project_h/100*h;
w=project_w/100*w;
dx=project_w/100*dx;
dy=project_h/100*dy;
gfx_blit(0,1);
s==1?(
    gfx_set(0.5,0.5,0.5,0.5);
    gfx_fillrect(w+sd+dx,h+sd+dy,project_w-(w*2)+sd,project_h-(h*2)+sd);
);
gfx_set(R,G,B,A);
gfx_fillrect(w+dx,h+dy,project_w-(w*2),project_h-(h*2));
</pre>
[my solidcolor_enhanced](my_solidcolor_enhanced)

__________________

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

__________________

cropped overlay from ashcat_it  

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

papagirafe posted some tricks
<a href="https://forum.cockos.com/showthread.php?t=259354">Here</a>

__________________

Fabian freeze frame
<pre>
// Freeze frame
// Freezes the frame current when the freeze button flips from 0 to 1
// If freeze == 0 && prev_frezze == 0, just blit out what comes in (is automatic)
// If freeze == 1 && prev_freeze == 0, grab and hold current frame, prev_freeze = 1
// if freeze == 1 && prev_freeze == 1, blit out held frame
// If freeze == 0 && prev_freeze == 1, blit out what comes in, prev_freeze = 0
//@param1:freeze 'freeze' 0 0 1 0.5 1

src = 0;
input_info(src,w,h) ? ( project_w = w; project_h = h; ); // preserve input dimensions

/*(freeze == 0 && prev_freeze == 0) ?
(
  // No need to do anything
):*/
(freeze == 1 && prev_freeze == 0) ?
(
  myhandle = gfx_img_hold(src); // grab the current frame
  prev_freeze = 1;
):
(freeze == 1 && prev_freeze == 1) ?
(
  //  gfx_dest = -1;
  gfx_blit(myhandle); // blit out the grabbed frame
):
(freeze == 0 && prev_freeze == 1) ?
(
  gfx_img_free(myhandle); // discard the grabbed frame
  prev_freeze = 0;
);
</pre>

__________________

my actual [videoprocessor presets (RPL)](videoprozessorpresets_no_js.RPL)  
handle with care  
importing may overwrite your personal presets  

------------------

a function by [papagirafe](https://forum.cockos.com/member.php?u=144400) to allocate an temporary image with an alpha plane (i.e. with transparent background).Of course you need to gfx_blit() with mode=0x10000  

<pre>
function gfx_img_alloc_transparent(w,h) 
(
  img=gfx_img_alloc();           // first, image handle only
  gfx_img_resize(img,-1,-1);     // incantation to summon alpha plane
  gfx_img_resize(img,w,h);       // real size now
  gfx_set(0,0,0,0,0x10000,img);  // 100% transparent "black"
  gfx_fillrect(0,0,w,h);         
  img;
);
</pre>
__________________  

outlined text the papagirafe kind  

quote: Here is an much better looking version. Keep in mind that the text is drawn as many time as the parameter "outline divs" + 1. Caveat: "text alpha" controls the transparency of the text *and* outline which mean the outline color will bleed into the text color if alpha is < 1.

<pre>
// Overlay: Text v2.1 w/ajustable outline
// by papagirafe
// Write your own text inside quotes, multiple lines allowed, ""=item/track name
#text=""; 
// default font = "Arial" in Windows
font="";   
/*
  font styles from following list - multiple choices allowed - uppercase mandatory 
  'B' - Bold,   'I' - Italics,  'R' - Blur aka smooth edges (no effect with S/O),
  'S' - Shadow, 'O' - Outline(stock version),  'V' - Invert bg/fg,
  'M' - monospace (if choice exists with the chosen font) 
  'U' - underlined 
*/
style = 'R';   

//@param size 'text height' 0.05 0.01 1.0 0.5 0.001
//@param xpos 'x position' 0.5 0 1 0.5 0.01
//@param ypos 'y position' 0.5 0 1 0.5 0.01
//@param useWet 'use item fade' 1 0 1 0.5 1

//@param6:fgr 'text r' 1.0 0 1 0.5 0.01
//@param fgg 'text g' 1.0 0 1 0.5 0.01
//@param fgb 'text b' 1.0 0 1 0.5 0.01
//@param fga 'text a' 1.0 0 1 0.5 0.01

//@param11:bgh 'bg h' 0 0 1 0.5 0.01
//@param bgw 'bg w' 0 0 600 0.5 1
//@param bgr 'bg r' 0 0 1 0.5 0.01
//@param bgg 'bg g' 0 0 1 0.5 0.01
//@param bgb 'bg b' 0 0 1 0.5 0.01
//@param bga 'bg a' 0.5 0 1 0.5 0.01

//@param18:olr 'outline r' 0 0 1 0.5 0.01
//@param olg 'outline g' 0 0 1 0.5 0.01
//@param olb 'outline b' 0 0 1 0.5 0.01
//@param olt 'outline thickness' 0 0 100 50 1
//@param oldiv 'outline divs' 8 8 64 32 1

function polar2xy(r,phi,x*,y*)
(
  x=r*cos(phi);
  y=r*sin(phi);
);

wet=useWet?param_wet:1;    

input = 0;
project_wh_valid===0 ? input_info(input,project_w,project_h);
gfx_blit(input,1);
gfx_setfont(size*project_h,font,style);
strcmp(#text,"")==0 ? input_get_name(-1,#text);
gfx_str_measure(#text,txtw,txth);
yt = (project_h- txth*(1+bgh*2))*ypos;
gfx_set(bgr,bgg,bgb,bga*wet);
gfx_fillrect(xpos*(project_w-txtw)-bgw, yt, txtw+bgw*2, txth*(1+bgh*2));

olt>0?(
  gfx_set(olr,olg,olb,fga);
  i=0; loop(2*oldiv, 
    phi=i*$pi/oldiv;
    polar2xy(olt,phi,ox,oy);
    gfx_str_draw(#text,xpos*(project_w-txtw)+ox,yt+txth*bgh+oy,olr,olg,olb);
    i+=1;
  );
);

gfx_set(fgr,fgg,fgb,fga*wet);
gfx_str_draw(#text,xpos * (project_w-txtw),yt+txth*bgh,olr,olg,olb);

</pre>
------------------  

more to come  

__________________

<a href="https://bobobo-git.github.io/REAPER/">site</a><a style="float:right;" href="https://github.com/bobobo-git/REAPER/">.</a>
