NB. define color primitives (rgb)
r=: 255 0 0
g=: 0 255 0
b=: 0 0 255

NB. define rgb color channels 
r_jpg=: verb : '( (y,3) $ r )'
g_jpg=: verb : '( (y,3) $ g )'
b_jpg=: verb : '( (y,3) $ b )'
w_jpg=: verb : '( (y,3) $ ( r + g + b ) )'

NB. define cymk color channels
c_jpg=: verb : '( (y,3) $ ( g + b ) )'
y_jpg=: verb : '( (y,3) $ ( r + g ) )'
m_jpg=: verb : '( (y,3) $ ( b + r ) )'
k_jpg=: verb : '( (y,3) $ ( 0 * i.3 ) )'
