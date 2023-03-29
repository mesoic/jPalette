#!/usr/bin/ijconsole

NB. assign lib constants and load libraries
USEQTJPEG_jjpeg_=: USEJAJPEG_jjpeg_=: USEJNJPEG_jjpeg_=: 0 NB. USEPPJPEG_jjpeg_=: 0
load'graphics/jpeg bmp'

load'../func.ijs'
load'../chan.ijs'

NB. define test data path
path=:'./base/'

NB. define test geometry
shape=: 200 300

NB. build and return channel datasets
build_chan=: verb : 0
select. y
case. 'w.jpg' do. (w_jpg shape)
case. 'r.jpg' do. (r_jpg shape)
case. 'g.jpg' do. (g_jpg shape)
case. 'b.jpg' do. (b_jpg shape)
case. 'c.jpg' do. (c_jpg shape)
case. 'y.jpg' do. (y_jpg shape)
case. 'm.jpg' do. (m_jpg shape)
case. 'k.jpg' do. (k_jpg shape)
case. do. _1
end.
)

NB. define validation function
validate_chan=: verb : 0
chan_w=: build_chan y
chan_w writejpeg jpath (path,y)
chan_r=: readjpeg jpath (path,y)
res=: (map_rgb chan_r) - (chan_w)
if. |(sum res % ((0 { $ res) * (1 { $ res))) < 2 do. echo y,' : PASS'
elseif. do. echo y,' : FAIL'
end.
)

NB. validate channels
validate_chan 'w.jpg'
validate_chan 'r.jpg'
validate_chan 'g.jpg'
validate_chan 'b.jpg'
validate_chan 'c.jpg'
validate_chan 'y.jpg'
validate_chan 'm.jpg'
validate_chan 'k.jpg'

NB. exit console
exit''
