local g = grid.connect()
local glyphs = {}
local glyphindex = 1

function init() 
  gridredraw(glyphs[glyphindex])
  redraw()
end

function updateScreen(val)
  screen.clear()
  screen.move(20,20)
  screen.text(val)
  screen.update()
end

function redraw()
  screen.clear()
  screen.move(10,10)
  screen.text("test")
  screen.update_default()
end

function enc(n,d)
  if n==3 then glyphindex = util.clamp(glyphindex + d,1,3) end
  gridredraw(glyphs[glyphindex])
  print(glyphindex)
  updateScreen(glyphindex)
  
end

function gridredraw(pattern)
  g:all(0)
  for yi = 1, 8 do
      for xi = 1, 8 do
        if(pattern[yi][xi] == 1) then
          g:led(xi, yi,  15)
        end
      end
    end
  g:refresh()
end


glyphs[1] ={
  {1,1,1,1,1,0,0,0},
  {1,1,1,1,1,0,0,0},
  {0,0,0,1,1,0,0,0},
  {0,0,0,1,1,0,0,0},
  {0,0,0,1,1,0,0,0},
  {0,0,0,1,1,0,0,0},
  {0,1,1,1,1,1,1,0},
  {0,1,1,1,1,1,1,0}
}


glyphs[2] ={
  {1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
}

glyphs[3] ={
  {1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,1,0,0,0},
  {0,0,0,0,1,0,0,0},
  {0,0,0,0,1,1,0,0},
  {0,0,0,0,0,1,1,0},
  {0,0,0,0,0,0,1,0},
  {0,0,0,0,0,0,1,1},
}
