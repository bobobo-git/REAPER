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


more to come  


<a href="https://bobobo-git.github.io/REAPER/">site</a><a style="float:right;" href="https://github.com/bobobo-git/REAPER/">.</a>
