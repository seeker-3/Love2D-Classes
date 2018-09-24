Circle = class(Point)
Circle.spd = 200

function Circle:init (x, y, r)
  self.x = x
  self.y = y
  self.r = r
end

function Circle:draw ()
  love.graphics.circle('line', self.x, self.y, self.r)
end

function Circle:collisionCircle (circle)
  return self:dis(circle.x, circle.y) < (self.r - circle.r) ^ 2
end

function Circle:collisionPoint (x, y)
  return self:dis(x, y) < self.r ^ 2
end

function Circle:collisionLine (line)
  local m = line:slope()
  if m == math.huge then return self.x == line.x1
    and self.y < math.max(line.y1, line.y2)
    and self.y > math.min(line.y1, line.y2)
  end
  local b = line.y1 - m * line.x1
  local x = (self.x / m + self.y - b) / (1 / m + m)
  local y = x * m + b

  return self:collisionPoint(
    math.min(math.max(x, line.x1), line.x2),
    math.min(math.max(y, line.y1), line.y2))
end

function Circle:collision (rect) return self.r ^ 2
  > math.max(math.abs(self.x - rect:midX()) - rect.w/2, 0) ^ 2
  + math.max(math.abs(self.y - rect:midY()) - rect.h/2, 0) ^ 2
end
