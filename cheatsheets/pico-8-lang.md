# pico-8 lang

> PICO-8 API reference, grouped by job. Optional arguments are in `[ ]`.

# Callbacks

- `_init()` - once on cart start
- `_update()` - logic tick, 30Hz
- `_update60()` - logic tick, 60Hz
- `_draw()` - render after each update

# Graphics

- `cls([c])` - clear screen to colour c
- `color([c])` - set default draw colour
- `pset(x,y,[c])` - set pixel
- `pget(x,y)` - get pixel colour
- `line(x0,y0,x1,y1,[c])` - line
- `rect(x0,y0,x1,y1,[c])` - rectangle outline
- `rectfill(x0,y0,x1,y1,[c])` - filled rectangle
- `circ(x,y,r,[c])` - circle outline
- `circfill(x,y,r,[c])` - filled circle
- `rrect(x0,y0,x1,y1,r,[c])` - rounded rect outline (0.2.7+)
- `print(str,[x,y,[c]])` - print text, returns end x
- `camera([x,y])` - set camera offset
- `clip([x,y,w,h])` - set clipping region
- `pal([c0,c1,[p]])` - remap colour c0 to c1, p=0 display, p=1 sprite
- `palt([c,t])` - set colour c transparency (true/false)
- `fillp([pat])` - set fill pattern

# Sprites

- `spr(n,x,y,[w,h],[fx],[fy])` - draw sprite n, w,h in tiles, fx,fy flip
- `sspr(sx,sy,sw,sh,dx,dy,[dw,dh,fx,fy])` - stretch blit from sprite sheet

# Map

- `map(mx,my,sx,sy,w,h,[layer])` - draw map region to screen
- `mget(x,y)` - tile at map cell
- `mset(x,y,v)` - set tile at map cell

# Input

- `btn([i,[p]])` - true while button i held, p=player (0/1)
- `btnp([i,[p]])` - true on first press and repeat, 15f delay, 4f interval
- Buttons: `0=left 1=right 2=up 3=down 4=O 5=X`

# Audio

- `sfx(n,[chan,[offset]])` - play SFX n, n=-1 stops all
- `music([n,[fade,[mask]]])` - play music pattern n, n=-1 stops

# Math

- `flr(x)` - floor (toward -inf)
- `ceil(x)` - ceiling
- `rnd(x)` - random number 0..x
- `abs(x)` - absolute value
- `min(x,y)`, `max(x,y)`: min, max
- `sgn(x)` - sign, -1, 0 or 1
- `sqrt(x)` - square root
- `cos(x)`, `sin(x)`: input is 0..1 turns, not radians
- `atan2(dx,dy)` - angle as 0..1 turns

# Tables

- `add(t,v,[i])` - append v to t, or insert at i
- `del(t,v)` - remove first matching value
- `deli(t,i)` - remove element at index i
- `count(t,[v])` - count elements, or matching v
- `all(t)` - array iterator for `for..in`
- `pairs(t)` - key-value iterator

# Strings

- `chr(n)` - number to character
- `ord(str,[i])` - character to number
- `tostr(v,[fmt])` - value to string
- `tonum(str)` - string to number
- `sub(str,i,[j])` - substring i to j

# Memory

- `peek(addr)`, `poke(addr,v)`: byte read, write
- `peek2`, `poke2`, `peek4`, `poke4`: 16-bit and 32-bit fixed-point read, write
- `@addr`, `%addr`, `$addr`: short-form byte, 16-bit, fixed-point read
- `memcpy(dest,src,len)` - copy memory region
- `stat(n)` - query system state (index in the full manual)

# System

- `menuitem(i,[label,fn])` - add pause menu item, i=1..5
- `poke(0x5F2D, 1)` - enable devkit input (mouse and raw keyboard)
- `stat(30)`, `stat(31)`: keypress available, last key char
- `stat(32)`, `stat(33)`: mouse X, Y
- `stat(34)` - mouse buttons, bit0=L, bit1=R, bit2=M

# See also

- `cheat pico-8` - the launchers
- `cheat pico-8-shortcuts` - editor and runtime keys
