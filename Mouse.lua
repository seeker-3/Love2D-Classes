Mouse = Object()
Mouse.dict = {}
Mouse.left = 'up'
Mouse.right = 'up'

function Mouse:update (dt)
  self.x, self.y = love.mouse.getPosition()
  self:updateKey('left')
  self:updateKey('right')
end

function Mouse:updateKey (btn)
  btn = btn or 'left'
  if love.mouse.isDown(btn == 'left' and 1 or 2) then
    if Mouse[btn] == 'up' or Mouse[btn] == 'released' then
      Mouse[btn] = 'pressed'
    else Mouse[btn] = 'down' end
  else
    if Mouse[btn] == 'down' or Mouse[btn] == 'pressed' then
      Mouse[btn] = 'released'
    else Mouse[btn] = 'up' end
  end
end

function Mouse:pressed(btn)
  return self[btn or 'left'] == 'pressed'
end

function Mouse:released(btn)
  return self[btn or 'left'] == 'released'
end

function Mouse:isDown(btn)
  return self[btn or 'left'] == 'down' or self[btn] == 'pressed'
end

function Mouse:rect()
  return {
    x = self.x,
    y = self.y,
    w = 0,
    h = 0,
  }
end
