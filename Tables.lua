window = {
  x = 0,
  y = 0,
  w  = love.graphics.getWidth(),
  h = love.graphics.getHeight(),
  midX   = love.graphics.getWidth()/2,
  midY   = love.graphics.getHeight()/2
}

top = 0
bottom = 0
left = 0
right = 0
border = {
  x = left,
  y = top,
  w = love.graphics.getWidth() - left - right,
  h = love.graphics.getHeight() - top - bottom,
}
border.midX = border.x + border.w  / 2
border.midY = border.y + border.h / 2
