#!/usr/bin/ijconsole

NB. assign lib constants and load libraries
USEQTJPEG_jjpeg_=: USEJAJPEG_jjpeg_=: USEJNJPEG_jjpeg_=: 0 NB. USEPPJPEG_jjpeg_=: 0
load'graphics/jpeg bmp'
load'stats'

NB. define shape selectors
dim_x=: 0 { $
dim_y=: 1 { $

NB. define color selectors
rs=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 0) { y'
gs=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 1) { y'
bs=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 2) { y'

NB. average over a rank n array
avg=: verb : '(((+/)^:(#@$)) % (#@,))'

NB. define image shape
shape=: 10 10 3

NB. define color base
r=: 255 0 0
g=: 0 255 0
b=: 0 0 255

NB. write basecolor outputs
( shape $ r ) writejpeg jpath './colorbase/r.jpg'
( shape $ g ) writejpeg jpath './colorbase/g.jpg'
( shape $ b ) writejpeg jpath './colorbase/b.jpg'

( shape $ ( g + b ) ) writejpeg jpath './colorbase/c.jpg'
( shape $ ( r + g ) ) writejpeg jpath './colorbase/y.jpg'
( shape $ ( b + r ) ) writejpeg jpath './colorbase/m.jpg'

( shape $ ( 0 * i.3 ) ) writejpeg jpath './colorbase/k.jpg'
( shape $ ( r + g + b ) ) writejpeg jpath './colorbase/w.jpg'

NB. extract color channels
NB.   111111100000000000000000 r
NB.   000000001111111100000001 g
NB.   000000000000000011111110 b
dat=: readjpeg jpath './colorbase/r.jpg'

shape =: ($ dat),3

NB. define color channels
rdat=: #. (< (i.(0 { shape)) ; (i.(1 { shape)) ; (1  + i.8)) { #: dat + 2^24
gdat=: #. (< (i.(0 { shape)) ; (i.(1 { shape)) ; (9  + i.8)) { #: dat + 2^24
bdat=: #. (< (i.(0 { shape)) ; (i.(1 { shape)) ; (17 + i.8)) { #: dat + 2^24

rchan=: (rdat) (<(i.(0 { shape));(i.(1 { shape));0) } ( shape $ 0 0 0 )
gchan=: (gdat) (<(i.(0 { shape));(i.(1 { shape));1) } ( shape $ 0 0 0 )
bchan=: (bdat) (<(i.(0 { shape));(i.(1 { shape));2) } ( shape $ 0 0 0 )
