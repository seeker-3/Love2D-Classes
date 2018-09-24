Point = class()

function Point:init (x, y)
  self.x = x
  self.y = y
end

function Point:draw ()
  love.graphics.points(self.x, self.y)
end

function Point:set (x, y)
  self.x = x
  self.y = y
end

function Point:midX ()
  return self.x
end

function Point:midY ()
  return self.y
end

function Point:mid ()
  return self.x, self.y
end

function Point:dis (x, y)
  return (self.x - x) ^ 2 + (self.y - y) ^ 2
end
