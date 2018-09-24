Rect = class(Point)

function Rect:init(x, y, w, h)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
end

function Rect:draw(mode)
  love.graphics.rectangle(mode or 'line', math.floor(self.x), math.floor(self.y),
    self.w, self.h)
end

function Rect:midX ()
  return self.x + self.w/2
end

function Rect:midY ()
  return self.y + self.h/2
end

function Rect:mid ()
  return self:midX(), self:midY()
end

function Rect:center(x, y)
  self:centerX(x)
  self:centerY(y)
  return self
end

function Rect:centerX(x)
  self.x = x/2 - self.w / 2
  return self
end

function Rect:centerY(y)
  self.y = y/2 - self.h/2
  return self
end

function Rect:collision(rect, x, y)
  x = x or 0
  y = y or 0
  return self.x + x <= rect.x + rect.w and
    rect.x <= self.x + self.w + x and
    self.y + y <= rect.y + rect.h and
    rect.y <= self.y + self.h + y
end

function Rect:within(rect, x, y)
  return rect.x + x < self.x and
    self.x + self.w < rect.x + rect.w - x and
    rect.y + y < self.y and
    self.y + self.h < rect.y + rect.h - y
end

function Rect:collisionPoint (x, y)
  return self.x <= x and x < self.x + self.w and
         self.y <= y and y < self.y + self.h
end
