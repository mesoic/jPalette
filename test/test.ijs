#!/usr/bin/ijconsole

NB. assign lib constants and load libraries
USEQTJPEG_jjpeg_=: USEJAJPEG_jjpeg_=: USEJNJPEG_jjpeg_=: 0 NB. USEPPJPEG_jjpeg_=: 0
load'graphics/jpeg bmp'

load'../func.ijs'
load'../chan.ijs'

NB. define test data path
path=:'./base/'

NB. define validation
is_valid=: verb : '|(sum y % ((0 { $ y) * (1 { $ y)))'

NB. define image shape (m x n) pixels
shape=: 200 300

NB. write basecolor outputs
(r_jpg shape) writejpeg jpath (path,'r.jpg')
(g_jpg shape) writejpeg jpath (path,'g.jpg')
(b_jpg shape) writejpeg jpath (path,'b.jpg')
(w_jpg shape) writejpeg jpath (path,'w.jpg')

(c_jpg shape) writejpeg jpath (path,'c.jpg')
(y_jpg shape) writejpeg jpath (path,'y.jpg')
(m_jpg shape) writejpeg jpath (path,'m.jpg')
(k_jpg shape) writejpeg jpath (path,'k.jpg')

NB. extract color channels
r_dat=: readjpeg jpath (path,'r.jpg')
r_res=: (map_rgb r_dat) - (r_jpg shape)
echo is_valid r_res