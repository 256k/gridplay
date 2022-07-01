--          "Gridplay"                   
-- experimenting with animation 
--            by 256k                 
-- --------------------------------
-- K1: RESET ALL FRAMES 
-- K3: 
-- E2: 
-- E3: manually move frames

local g = grid.connect()
local glyphs = {}
local glyphindex = 0

function init() 
  glyphs[glyphindex] = welcomeGlyph
  gridredraw(glyphs[glyphindex])
  updateScreen(glyphindex)
  redraw()
  
end

function updateScreen(val)
  screen.clear()
  screen.move(10, 10)
  screen.text("Frame: ")
  screen.move(40,10)
  screen.text(val)
  screen.update()
end

function redraw()
  screen.font_size(8)
  screen.clear()
  screen.move(1,10)
  screen.text("Hi!")
  screen.move(1,25)
  screen.text("Move E3:")
  screen.move(1,35)
  screen.text("to advance between frames")
  screen.move(1,50)
  screen.text("press grid buttons:")
  screen.move(1,60)
  screen.text("to draw the frame")
  screen.update_default()
end

function key(n,z) 
  if n==1 and z==1 then 
    glyphs = {}
    glyphindex = 1
    glyphs[glyphindex] = initializePage()
    gridredraw(glyphs[glyphindex])
    updateScreen(glyphindex)
  end
end

function enc(n,d)
  if n==3 and glyphindex + d >= 1 then glyphindex = glyphindex + d end
  if glyphs[glyphindex] == nil then glyphs[glyphindex] = initializePage() end 
  
  gridredraw(glyphs[glyphindex])
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

function g.key(x,y,z) -- define what happens if a grid key is pressed or released
  if z==1 then -- if a grid key is pressed down...
    if glyphs[glyphindex][y][x] == 0 then 
    glyphs[glyphindex][y][x] = 1 else
     glyphs[glyphindex][y][x] = 0
     end
    gridredraw(glyphs[glyphindex])
  end
end


function initializePage()
  return {
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0},
}
end

welcomeGlyph ={
  {1,0,0,1,0,0,0,0},
  {1,0,0,1,0,0,1,0},
  {1,0,0,1,0,0,0,0},
  {1,0,0,1,0,0,1,0},
  {1,1,1,1,0,0,1,0},
  {1,0,0,1,0,0,1,0},
  {1,0,0,1,0,0,1,0},
  {1,0,0,1,0,0,1,0},
}


-- glyphs[2] ={
--   {1,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
-- }

-- glyphs[3] ={
--   {1,0,0,0,0,0,0,0},
--   {0,0,0,0,0,0,0,0},
--   {0,0,0,0,1,0,0,0},
--   {0,0,0,0,1,0,0,0},
--   {0,0,0,0,1,1,0,0},
--   {0,0,0,0,0,1,1,0},
--   {0,0,0,0,0,0,1,0},
--   {0,0,0,0,0,0,1,1},
-- }
