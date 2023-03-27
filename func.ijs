load'stats'

NB. define average over a rank n array
avg=: verb : '(((+/)^:(#@$)) % (#@,)) y'
sum=: verb : '+/ ,y'

NB. define color channels to flattened rgb (n x m x 3) => (n x m)_r,g,b
r_vals=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 0) { y'
g_vals=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 1) { y'
b_vals=: verb : '(< (i.(0 { $ y)) ; (i.(1 { $ y)) ; 2) { y'

NB. define raw decimal data to flattened rgb (n x m) => (n x m)_r,g,b
r_data=: verb : '#. (< (i.(0 { $ y)) ; (i.(1 { $ y)) ; (1  + i.8)) { #: y + 2^24'
g_data=: verb : '#. (< (i.(0 { $ y)) ; (i.(1 { $ y)) ; (9  + i.8)) { #: y + 2^24'
b_data=: verb : '#. (< (i.(0 { $ y)) ; (i.(1 { $ y)) ; (17 + i.8)) { #: y + 2^24'

NB. define flattened rgb to color channels transfom (n x m)_r,g,b => (n x m x 3)
r_chan=: verb : '(r_data y) (<(i.(0 { $ y));(i.(1 { $ y));0) } ( (($ y),3) $ 0 0 0 )'
g_chan=: verb : '(g_data y) (<(i.(0 { $ y));(i.(1 { $ y));1) } ( (($ y),3) $ 0 0 0 )'
b_chan=: verb : '(b_data y) (<(i.(0 { $ y));(i.(1 { $ y));2) } ( (($ y),3) $ 0 0 0 )'

NB. define rgb channel addition
map_rgb=: verb : '(r_chan + (g_chan + b_chan)) y'
