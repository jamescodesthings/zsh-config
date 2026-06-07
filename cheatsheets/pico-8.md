# pico-8

PICO-8 API reference.

## Callbacks

- Run once on cart start:

`_init()`

- Logic tick, 30Hz:

`_update()`

- Logic tick, 60Hz:

`_update60()`

- Render after each update:

`_draw()`

## Graphics

- Clear screen to colour c:

`cls([c])`

- Set default draw colour:

`color([c])`

- Set pixel:

`pset(x,y,[c])`

- Get pixel colour:

`pget(x,y)`

- Draw line:

`line(x0,y0,x1,y1,[c])`

- Rectangle outline:

`rect(x0,y0,x1,y1,[c])`

- Filled rectangle:

`rectfill(x0,y0,x1,y1,[c])`

- Circle outline:

`circ(x,y,r,[c])`

- Filled circle:

`circfill(x,y,r,[c])`

- Rounded rect outline (0.2.7+):

`rrect(x0,y0,x1,y1,r,[c])`

- Print text; returns end x:

`print(str,[x,y,[c]])`

- Set camera offset:

`camera([x,y])`

- Set clipping region:

`clip([x,y,w,h])`

- Remap colour c0->c1; p=0 display, p=1 sprite:

`pal([c0,c1,[p]])`

- Set colour c transparency (true/false):

`palt([c,t])`

- Set fill pattern:

`fillp([pat])`

## Sprites

- Draw sprite n at (x,y); w,h in tiles; fx,fy flip:

`spr(n,x,y,[w,h],[fx],[fy])`

- Stretch blit from sprite sheet:

`sspr(sx,sy,sw,sh,dx,dy,[dw,dh,fx,fy])`

## Map

- Draw map region to screen:

`map(mx,my,sx,sy,w,h,[layer])`

- Get tile at map cell:

`mget(x,y)`

- Set tile at map cell:

`mset(x,y,v)`

## Input

- True while button i held; p=player (0/1):

`btn([i,[p]])`

- True on first press + repeat; 15f delay, 4f interval:

`btnp([i,[p]])`

- Button indices:

`0=← 1=→ 2=up 3=dn 4=O 5=X`

## Audio

- Play SFX n; n=-1 stop all:

`sfx(n,[chan,[offset]])`

- Play music pattern n; n=-1 stop:

`music([n,[fade,[mask]]])`

## Math

- Floor (round toward -∞):

`flr(x)`

- Ceiling:

`ceil(x)`

- Random number 0..x:

`rnd(x)`

- Absolute value:

`abs(x)`

- Min / max of two values:

`min(x,y) / max(x,y)`

- Sign: -1, 0, or 1:

`sgn(x)`

- Square root:

`sqrt(x)`

- Trig - input 0..1 turns (not radians!):

`cos(x) / sin(x)`

- Angle as 0..1 turns:

`atan2(dx,dy)`

## Tables

- Append v to table t (or insert at i):

`add(t,v,[i])`

- Remove first matching value from t:

`del(t,v)`

- Remove element at index i:

`deli(t,i)`

- Count elements (or matching v):

`count(t,[v])`

- Array iterator for for..in:

`all(t)`

- Key-value iterator:

`pairs(t)`

## Strings

- Number to character:

`chr(n)`

- Character to number:

`ord(str,[i])`

- Convert value to string:

`tostr(v,[fmt])`

- Convert string to number:

`tonum(str)`

- Substring from i to j:

`sub(str,i,[j])`

## Memory

- Byte read / write:

`peek(addr) / poke(addr,v)`

- 16-bit / 32-bit fixed-point R/W:

`peek2/poke2, peek4/poke4`

- Short-form: byte / 16-bit / fixed-point read:

`@addr / %addr / $addr`

- Copy memory region:

`memcpy(dest,src,len)`

- Query system state (see index in full manual):

`stat(n)`

## System

- Add item to pause menu (i=1..5):

`menuitem(i,[label,fn])`

- Enable devkit input (mouse + raw keyboard):

`poke(0x5F2D, 1)`

- Keypress available / last key char:

`stat(30) / stat(31)`

- Mouse X / Y position:

`stat(32) / stat(33)`

- Mouse buttons (bit0=L, bit1=R, bit2=M):

`stat(34)`

## Related commands

- PICO-8 keyboard shortcuts
`cheat pico-8-shortcuts`
