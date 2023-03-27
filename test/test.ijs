#!/usr/bin/ijconsole

NB. assign lib constants and load libraries
USEQTJPEG_jjpeg_=: USEJAJPEG_jjpeg_=: USEJNJPEG_jjpeg_=: 0 NB. USEPPJPEG_jjpeg_=: 0
load'graphics/jpeg bmp'
load'../func.ijs'

NB. define test data path
path=:'./base/'

NB. define image shape (m x n) pixels
shape=: 200 300

NB. write basecolor outputs
( (shape,3) $ r ) writejpeg jpath (path,'r.jpg')
( (shape,3) $ g ) writejpeg jpath (path,'g.jpg')
( (shape,3) $ b ) writejpeg jpath (path,'b.jpg')

( (shape,3) $ ( g + b ) ) writejpeg jpath (path,'c.jpg')
( (shape,3) $ ( r + g ) ) writejpeg jpath (path,'y.jpg')
( (shape,3) $ ( b + r ) ) writejpeg jpath (path,'m.jpg')

( (shape,3) $ ( 0 * i.3 ) ) writejpeg jpath (path,'k.jpg')
( (shape,3) $ ( r + g + b ) ) writejpeg jpath (path,'w.jpg')

NB. NB. extract color channels
data=: readjpeg jpath (path,'r.jpg')
