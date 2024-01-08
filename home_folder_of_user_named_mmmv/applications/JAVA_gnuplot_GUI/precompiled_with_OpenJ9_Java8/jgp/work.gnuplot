set terminal X11 
set title "" 
set xlabel "seeonX" 
set ylabel "seeonY" 
set zlabel "" 
unset logscale x 
set logscale y 
unset logscale z 
plot [0.0:30.0] [:] [:] '/home/twsl2/tmp_/test/juraandmed.txt' using 1:2  with histeps     title "Pealkiri "  
pause -1
