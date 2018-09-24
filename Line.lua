Line = class()

height = 40

function Line:init(x1, y1, x2, y2, dmg)
  self.x1 = x1
  self.y1 = y1
  self.x2 = x2
  self.y2 = y2
end

function Line:draw()
  love.graphics.line(self.x1, self.y1, self.x2, self.y2)
end

function Line:theta()
  local rise = self.y2 - self.y1
  local run = self.x2 - self.x1
  local rad = math.acos(run / (rise ^ 2 + run ^ 2) ^ .5)
  return rise < 0 and 2 * math.pi - rad or rad
end

function Line:slope()
  return self.x1 == self.x2 and math.huge or (self.y2 - self.y1) / (self.x2 - self.x1)
end

function Line:collisionLine (line)
  local x2 = self.x + 10
  local y2 = self.y - 1 / line:slope() * (x2 - self.x)

  local a1 = y2 - self.y
  local b1 = self.x - x2
  local c1 = a1 * self.x + b1 * self.y
  local a2 = line.y2 - line.y1
  local b2 = line.x1 - line.x2
  local c2 = a2 * line.x1 + b2 * line.y1
  local d = a1 * b2 - a2 * b1
  local x = (b2 * c1 - b1 * c2) / d
  local y = (a1 * c2 - a2 * c1) / d
end

function Line:collision(rect)
  local dx, dy = self.x2 - self.x1, self.y2 - self.y1

  local t0, t1 = 0, 1
  local p, q, r

  for side = 1, 4 do
    if     side == 1 then p, q = -dx, self.x1 - rect.x
    elseif side == 2 then p, q =  dx, rect.x  + rect.w - self.x1
    elseif side == 3 then p, q = -dy, self.y1 - rect.y
    else                  p, q =  dy, rect.y  + rect.h - self.y1
    end

    if p == 0 then
      if q < 0 then return nil end -- Segment is parallel and outside the bbox
    else
      r = q / p
      if p < 0 then
        if r > t1 then return nil
        elseif r > t0 then t0 = r
        end
      else -- p > 0
        if r < t0 then return nil
        elseif r < t1 then t1 = r
        end
      end
    end
  end
  return {
    x1 = self.x1 + t0 * dx,
    y1 = self.y1 + t0 * dy,
    x2 = self.x1 + t1 * dx,
    y2 = self.y1 + t1 * dy,
    dis = math.abs(self.x1 - self.x1 + t0 * dx + self.y1 - self.y1 + t0 * dy)
  }
end
